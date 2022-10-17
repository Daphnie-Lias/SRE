# API Service

| Category     | SLI | SLO                                                                                                         |
|--------------|-----|-------------------------------------------------------------------------------------------------------------|
| Availability |  total number of successful requests / total number of requests   | Application up 99% of the time over the last 1 hour                                                                                                        |
| Latency      |   buckets of requests in a histogram showing the 95th percentile over the last 1 hour  | 95% of  web requests completed successfully  below 100ms                                                                                 |
| Error Budget |  % remaining error budget = 1- % error used   | Error budget is defined at 20% over the last 1 hour |
| Throughput   | total number of successful web requests over 1 hour    | 5 Requests per second over the last 1 hour                                                              |
