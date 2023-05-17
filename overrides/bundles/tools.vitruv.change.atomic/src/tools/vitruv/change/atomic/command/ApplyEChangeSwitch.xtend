package tools.vitruv.change.atomic.command

import edu.kit.ipd.sdq.activextendannotations.Utility
import org.eclipse.emf.common.command.Command
import tools.vitruv.change.atomic.EChange

import static com.google.common.base.Preconditions.checkArgument
import static com.google.common.base.Preconditions.checkState

/**
 * Utility class for applying an EChange.
 */
@Utility
class ApplyEChangeSwitch {
	/**
	 * Applies a given {@link EChange}. The change needs to be resolved.
	 * @param change					The {@link EChange} which will be applied.
	 * @param applyForward				If {@code true} the change will be applied forward,
	 * 									otherwise backward.
	 * @returns							The change was successfully applied.
	 * @throws IllegalArgumentException	The change is not resolve.
	 * @throws IllegalStateException	No commands can be generated for the change, or they cannot be executed.
	 */
	def static void applyEChange(EChange change, boolean applyForward) {
		checkArgument(change.isResolved, "EChange is not resolved: %s", change)

		val commands = if (applyForward) {
				ApplyForwardCommandSwitch.getCommands(change)
			} else {
				ApplyBackwardCommandSwitch.getCommands(change)
			}

		checkState(commands !== null, "no commands could be generated for EChange: %s", change)

		for (Command c : commands) {
			checkState(c.canExecute, "cannot execute command generated for EChange: %s", change)
			c.execute()
		}
	}

}
