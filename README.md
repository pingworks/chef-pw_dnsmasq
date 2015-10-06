# pw_dnsmasq-cookbook

Installs/Configures dnsmasq

## Supported Platforms

Ubuntu 14.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['pw_dnsmasq']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### pw_dnsmasq::default

Include `pw_dnsmasq` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[pw_dnsmasq::default]"
  ]
}
```

## License and Authors

Author:: Christoph Lukas (<christoph.lukas@gmx.net>)
