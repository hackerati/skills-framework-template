exports.handler = (event, context) => {
  console.log(`Lambda called. Event: ${JSON.stringify(event)}`);
  context.succeed();
};
