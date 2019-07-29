Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A76279233
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jul 2019 19:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728994AbfG2RdY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jul 2019 13:33:24 -0400
Received: from mail-eopbgr810130.outbound.protection.outlook.com ([40.107.81.130]:30795
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726709AbfG2RdY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Jul 2019 13:33:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHswST6a360En6gjh1ZsbN/1jq7s73zqk/NGoWd2PH1lSR9cXxHuzPCgOX5+W+kbdTGmNdTa3WICH7syrdhtjrKe3mkuMIkG1yMgBL7J2i4Li+bop4Mbz+w0YxiBuW8kJkZRGBYyGS/lzt2cNMOKGmxDTJkVPwQ0xcCgWqcP4otMh/Ho/EeujGumO30bpoLD31ForcaY5zTPdCR9fclJ23sg//2HEDTuhhWDJlGZugLkKVE+c/xL3mL65o9oDaqeAvI9nyRY0CLcszEmcihxTBkn3BFUSelUZRx+48596VAYri9cNq4oNMcIU2nG/uzTzMx6mlWuHYOmQSqlXfjhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFu0qygaFKWH4Ao14C/g0B+eJfnQFCMH4W8ZiqEBU0Q=;
 b=Vm7oC90diOSqxI9YpQi6PIrERYvQKYuyYpSyP9Br1iZafx9DKc5p7bC9OEOL4Zw4R841Sx0gb8l6ude6nY271dlxO6xxGO8qcJVLzNL6ukVEPqACcglmN7H102crR+F30u/wKZEKEOBVklnPA16dyLgKd728sjZt4Mh/ICPs1b6ouFDQ6/PJiE39xJ8xTXeUzXHRjC5Dtpq7rHLM3aZRPg2hzxzJwPwDmLADsclKlzkpj5bK+wvHON6Oz10DHtQMwUR3ZQzUvbfw+AQw18U33bR9VrtLCPR3Ps02L5VLH2RlLjeRzKwVu7DhU0zyrSkDgjt1+oBCn5qiW+kh2srcxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFu0qygaFKWH4Ao14C/g0B+eJfnQFCMH4W8ZiqEBU0Q=;
 b=C3J51/koLeztasxwNgB3BFWJW90NB8C8fYPERjUPvLdLjYtd0xC/SMZFLcay3k0leNpoBIOv1RADgDzYDm0H93pkFyRLLJ2Pv1tS/GkCa0y4/YhCyZb8I5un5FzucJV/PnteYTosXE4irE7rx3yOXVDWk9Moum5/MU6h3UxG5Yk=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1437.namprd22.prod.outlook.com (10.174.169.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Mon, 29 Jul 2019 17:33:09 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Mon, 29 Jul 2019
 17:33:09 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Chuanhong Guo <gch981213@gmail.com>
CC:     "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding
 documentation
Thread-Topic: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding
 documentation
Thread-Index: AQHVRjOw3AW/i5aXnkGo9okZQ3kHgA==
Date:   Mon, 29 Jul 2019 17:33:09 +0000
Message-ID: <20190729173307.ex2mf5hikzxl534v@pburton-laptop>
References: <20190724022310.28010-1-gch981213@gmail.com>
 <20190724022310.28010-5-gch981213@gmail.com>
In-Reply-To: <20190724022310.28010-5-gch981213@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::48) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7b67f9f-7868-4a47-9969-08d7144ad2a2
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1437;
x-ms-traffictypediagnostic: MWHPR2201MB1437:
x-microsoft-antispam-prvs: <MWHPR2201MB143757B72ADE3B76B7D0DFB4C1DD0@MWHPR2201MB1437.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(39840400004)(366004)(396003)(136003)(346002)(376002)(189003)(199004)(33716001)(6436002)(52116002)(76176011)(7416002)(25786009)(229853002)(6916009)(26005)(53936002)(3846002)(71190400001)(71200400001)(446003)(476003)(6486002)(58126008)(68736007)(8676002)(486006)(256004)(11346002)(186003)(6116002)(316002)(44832011)(1411001)(6246003)(4326008)(478600001)(14454004)(81156014)(66556008)(64756008)(66066001)(54906003)(81166006)(5660300002)(386003)(42882007)(1076003)(6512007)(2906002)(9686003)(6506007)(305945005)(7736002)(99286004)(66476007)(8936002)(66446008)(66946007)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1437;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qQDvbC9kCq/C6uU7fZ7/hjODgg4uf5t6DyDcQT7D5pZhd0MWXc/LJNYVnrXVdWRQ1gHrD91ILe3QQy+pjhLEQmHTe/q1rvwgK1/eW+rzrbVI2QO4K4qUZ6DfnClAcBIffd35Jwx5DiIegx9ks3lDYaonBAQzgDpUvuzFaxIcSgqRzwz5GNlXv6SE8wSw++b9nr6/ijZU/GNrCuXJGP2ps28Zg1Q2lYZSyGnQzrtLnmtLdDszs6Nexmaf1MAu54Oquhke3hQDgBjjyonf03fFjND+f1dJYfQGQSkE+L9br6pYx3K+3T3WxBrkUPRdnnTJT7T0zyfgzN527CGaYfSVpZoQBlDikSqZEOwKa/PBekPe0nU6k+0Adjzm5Bh1HsAmzKpwSJjWndAZjvEI59PQJmokcSZodcujZBZv998VsPs=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C26CC762CCD7CF42A8FC0CCA4047FDE4@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b67f9f-7868-4a47-9969-08d7144ad2a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 17:33:09.2423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1437
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Chuanhong,

On Wed, Jul 24, 2019 at 10:23:08AM +0800, Chuanhong Guo wrote:
> This commit adds device tree binding documentation for MT7621
> PLL controller.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>=20
> Change since v1:
> drop useless syscon in compatible string
>=20
>  .../bindings/clock/mediatek,mt7621-pll.txt     | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt76=
21-pll.txt

This binding needs review from DT maintainers before I apply it, but as
a general note it's typical to add the binding *before* its use in the
series. That is, this patch should come before patch 3.

Personally I'd squash it with patch 1 so the binding & the header file
needed to use the binding are added in one patch, then a later patch
actually makes use of them.

Thanks,
    Paul

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.=
txt b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt
> new file mode 100644
> index 000000000000..7dcfbd5283e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt
> @@ -0,0 +1,18 @@
> +Binding for Mediatek MT7621 PLL controller
> +
> +The PLL controller provides the 2 main clocks of the SoC: CPU and BUS.
> +
> +Required Properties:
> +- compatible: has to be "mediatek,mt7621-pll"
> +- #clock-cells: has to be one
> +
> +Optional properties:
> +- clock-output-names: should be "cpu", "bus"
> +
> +Example:
> +	pll {
> +		compatible =3D "mediatek,mt7621-pll";
> +
> +		#clock-cells =3D <1>;
> +		clock-output-names =3D "cpu", "bus";
> +	};
> --=20
> 2.21.0
>=20
