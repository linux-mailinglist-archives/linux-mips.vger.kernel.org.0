Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BBE52D089
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2019 22:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfE1UlZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 May 2019 16:41:25 -0400
Received: from mail-eopbgr720112.outbound.protection.outlook.com ([40.107.72.112]:50196
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726492AbfE1UlZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 May 2019 16:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCsZ4/qvNe2tDqEGUPV4hCzfX2bU9RlQCkIHm8XmD80=;
 b=PZpco6Q0TYF/HBhsYAhGwI3WAGtXBGk4DCUnTnMcdPuBCE2T0MTGcYGlW9xRCh6VtQ2F9x3zxN/0/HX95s0oscWW2nFQi1lgoy8JkalEQqMaCHuqB1dEmwiWQJ5D0LbuJAdMMI8rYGIyrf4nPZOBigsa/QDoVOmT1WP1MfGE6qM=
Received: from BN6PR2201MB1266.namprd22.prod.outlook.com (10.174.80.14) by
 BN6PR2201MB1396.namprd22.prod.outlook.com (10.172.29.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Tue, 28 May 2019 20:41:21 +0000
Received: from BN6PR2201MB1266.namprd22.prod.outlook.com
 ([fe80::201e:2693:29da:37de]) by BN6PR2201MB1266.namprd22.prod.outlook.com
 ([fe80::201e:2693:29da:37de%3]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 20:41:21 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stefan Roese <sr@denx.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH 5/8 v2] MIPS: ralink: mt7628a.dtsi: Add I2C controller DT
 node
Thread-Topic: [PATCH 5/8 v2] MIPS: ralink: mt7628a.dtsi: Add I2C controller DT
 node
Thread-Index: AQHVFGx7qzQP7YywYEGafkkjxxu2u6aBAo6A
Date:   Tue, 28 May 2019 20:41:21 +0000
Message-ID: <20190528204119.g7kvutxcprhwo56d@pburton-laptop>
References: <20190527091323.4582-1-sr@denx.de>
 <20190527091323.4582-5-sr@denx.de>
In-Reply-To: <20190527091323.4582-5-sr@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0041.namprd08.prod.outlook.com
 (2603:10b6:a03:117::18) To BN6PR2201MB1266.namprd22.prod.outlook.com
 (2603:10b6:405:20::14)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 463dcf04-ea80-4998-a954-08d6e3acd771
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN6PR2201MB1396;
x-ms-traffictypediagnostic: BN6PR2201MB1396:
x-microsoft-antispam-prvs: <BN6PR2201MB1396A230633A963D188F2F71C11E0@BN6PR2201MB1396.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(39850400004)(396003)(346002)(366004)(376002)(136003)(199004)(189003)(66556008)(229853002)(68736007)(66476007)(6512007)(66946007)(73956011)(9686003)(256004)(6436002)(42882007)(6486002)(486006)(66446008)(64756008)(44832011)(14454004)(66066001)(11346002)(1076003)(476003)(4744005)(186003)(316002)(6916009)(5660300002)(33716001)(54906003)(6506007)(99286004)(386003)(305945005)(71190400001)(2906002)(52116002)(7736002)(76176011)(102836004)(58126008)(446003)(4326008)(8936002)(26005)(6246003)(25786009)(6116002)(478600001)(81166006)(81156014)(3846002)(71200400001)(8676002)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:BN6PR2201MB1396;H:BN6PR2201MB1266.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XZFDaTLR7/tDRxOJfc72c7ODfyOQgQzm0N1I0WhB6UhnhjcSWOGZ4mV7KzCOEs8u2lk3eeyrI+SExBYhO1O0tRRhtB9DzMFX+Fosxl3RWBgAhAxH2V6f8B0pNgEiDmmm61Mm7beHRT+86l+zcuKTXYJPkYV8Rsy2zYh2yDr+K7HK7LVX1jmzV028byt2oEuURdtgBoCWA7n4yOJ14oEBz6sEFE2CoHwLMss9mHJgSDAzp9zfUKC6MXDfgGnpar2uFt+mkaDKO2WI7M2/ZGc34rWKrC8CtS0+mdVoiHCzmZgjicup62EetsLvP9S5+3kOJz+EfsKqDGJKpr7wgK1gf3+N0Pu2gZoqOapmoK5sHY5KOYJwJ/9rRSaZ4GgHwkt3ZtAQBT99uldezil/8h15hhiFhzZv948YzK9uhYDwzqA=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <89C500F6CD659142B1D6E5E6961F4F78@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 463dcf04-ea80-4998-a954-08d6e3acd771
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 20:41:21.5370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR2201MB1396
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Stefan,

On Mon, May 27, 2019 at 11:13:20AM +0200, Stefan Roese wrote:
> diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/=
ralink/mt7628a.dtsi
> index 0c2983c9c47c..64a425c7d639 100644
> --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> @@ -170,6 +170,22 @@
>  			interrupts =3D <6>;
>  		};
> =20
> +		i2c: i2c@900 {
> +			compatible =3D "mediatek,mt7621-i2c";
> +			reg =3D <0x900 0x100>;

I don't see this compatible string listed under
Documentation/devicetree/bindings, nor in
drivers/i2c/busses/i2c-mt65xx.c which I presume is the driver that would
handle it.

I guess this needs driver changes to be applied before it'll actually do
anything?

I'd prefer that at least the DT binding documentation goes in before we
add the nodes to the DT.

If those changes are already queued up somewhere else could you point me
at them?

Thanks,
    Paul
