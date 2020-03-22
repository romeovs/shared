import { Route, type RouteDef } from "@romeovs/frame/server"

export default {
	async routes(): Promise<RouteDef<mixed>[]> {
		return [
			Route("/", import("./pages/index"), {}),
		]
	},
}
