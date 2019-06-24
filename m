Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7B7451D0E
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfFXVYh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:24:37 -0400
Received: from mail-eopbgr700136.outbound.protection.outlook.com ([40.107.70.136]:14657
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726331AbfFXVYg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 17:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xigty8Fi/Aca7L/CiIFehAp8ADQhWub19fM2OT8n+2A=;
 b=f0vmmL1wVKxUrFX9xmYHk9m1WBiARsbdlnhH+na7pvkBV7OYD2skjQHm8xbYsGZHzZ85gBH0w/JIx5lecV5yv0zIZxNTwKCM38IrBfMDFO8/E7ClG94cy8TGVEYdLVaf83wx44dSc6bzVWg/CQKrEMgx3AJ/aq3FsUSFFh1xINM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1502.namprd22.prod.outlook.com (10.174.170.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Mon, 24 Jun 2019 21:24:33 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 21:24:33 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stefan Roese <sr@denx.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 5/8 v2] MIPS: ralink: mt7628a.dtsi: Add I2C controller DT
 node
Thread-Topic: [PATCH 5/8 v2] MIPS: ralink: mt7628a.dtsi: Add I2C controller DT
 node
Thread-Index: AQHVFGx7qzQP7YywYEGafkkjxxu2u6aBAo6AgACQyYCAKeo8gA==
Date:   Mon, 24 Jun 2019 21:24:33 +0000
Message-ID: <20190624212431.lopvs57iondijlyh@pburton-laptop>
References: <20190527091323.4582-1-sr@denx.de>
 <20190527091323.4582-5-sr@denx.de>
 <20190528204119.g7kvutxcprhwo56d@pburton-laptop>
 <96f6564a-e45b-a082-4682-c81dde8d22d5@denx.de>
In-Reply-To: <96f6564a-e45b-a082-4682-c81dde8d22d5@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 774b8cdd-687f-4f80-d35c-08d6f8ea59bf
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1502;
x-ms-traffictypediagnostic: MWHPR2201MB1502:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR2201MB1502A18C261624A8638A3DA3C1E00@MWHPR2201MB1502.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(346002)(366004)(136003)(39840400004)(376002)(396003)(199004)(189003)(55674003)(6512007)(9686003)(33716001)(73956011)(66556008)(64756008)(66446008)(66946007)(66476007)(4326008)(966005)(8936002)(5660300002)(8676002)(81166006)(81156014)(3846002)(316002)(68736007)(58126008)(54906003)(14454004)(478600001)(66066001)(6486002)(229853002)(99286004)(6436002)(6116002)(7736002)(2906002)(25786009)(305945005)(71200400001)(256004)(476003)(11346002)(446003)(71190400001)(486006)(44832011)(6916009)(1076003)(53546011)(6506007)(386003)(102836004)(76176011)(6306002)(42882007)(6246003)(26005)(186003)(52116002)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1502;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZI25T2sBNo2GIjG0CrWsKnLCeJHJJX/lEHpZp3Bw6E6rmd/rbAqxx4uYiMR7TnDIOq4xPjUTwfSh4QU0rx/KSKlynj3JNRd8+3ikodj9L5eAWBMFr+rik7QJQICrO0rI0qUyURsGTfbokiZG2VRcIJ+ZJeAXe7qRJ89Z7lxqauOY0Mk8+uL8jH7gHugJZcfRtG+8FKzSOiWvMyI3yQ1tUTp06Vc1QcDbGpdsjsQq9ixYnEHpJZarWlB+8Pt8q3UnReWOg4HgAqh05NyJE7BJPTnMJ4pr5P6q4QAhzF7YBBhmrxMozypE22lzQuHYqiMBzeiSKFq4w2rIMQUY0SFdnbJ9auHEeEuzEhZzqK5E5bqLeV+jShn8Zquu+88wwP1kfBulk7rp1Pu1px6IzGJbwLhfnoi3Qu3Ya9A8SrEp3/Q=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BAD3091A045C6747A1D63B999A02D9AA@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 774b8cdd-687f-4f80-d35c-08d6f8ea59bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 21:24:33.4255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1502
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Stefan,

On Wed, May 29, 2019 at 07:19:31AM +0200, Stefan Roese wrote:
> On 28.05.19 22:41, Paul Burton wrote:
> > On Mon, May 27, 2019 at 11:13:20AM +0200, Stefan Roese wrote:
> > > diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/=
dts/ralink/mt7628a.dtsi
> > > index 0c2983c9c47c..64a425c7d639 100644
> > > --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
> > > +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> > > @@ -170,6 +170,22 @@
> > >   			interrupts =3D <6>;
> > >   		};
> > > +		i2c: i2c@900 {
> > > +			compatible =3D "mediatek,mt7621-i2c";
> > > +			reg =3D <0x900 0x100>;
> >=20
> > I don't see this compatible string listed under
> > Documentation/devicetree/bindings, nor in
> > drivers/i2c/busses/i2c-mt65xx.c which I presume is the driver that woul=
d
> > handle it.
>=20
> No, these is a different driver queued for this (old) SoC. I've submitted
> it on the I2C list and am pretty hopeful, that it will hit next shortly:
>=20
> https://patchwork.ozlabs.org/patch/1095794/
>=20
> The bindings are included in this patch.
> > I guess this needs driver changes to be applied before it'll actually d=
o
> > anything?
>=20
> Correct.
> > I'd prefer that at least the DT binding documentation goes in before we
> > add the nodes to the DT.
>=20
> I understand. I've added Wolfram to Cc to perhaps comment on this.
> > If those changes are already queued up somewhere else could you point m=
e
> > at them?
>=20
> Please see above.

OK, I don't see the driver queued up yet so in the meantime I've applied
patches 1-4 & 6-7. If you could ping me or resend this one once the I2C
binding is in-tree, that would be wonderful.

Thanks,
    Paul
