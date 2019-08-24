Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 699B19BE2C
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2019 16:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727684AbfHXOMX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Aug 2019 10:12:23 -0400
Received: from mail-eopbgr750105.outbound.protection.outlook.com ([40.107.75.105]:12933
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727682AbfHXOMW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 24 Aug 2019 10:12:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGPvosZgXP0/2dL5ztXVTKDAqH9kwauAfY2YrePblwibo9B0AnDggy0wR5tW0GF8nWjs+rjqhRGqsmwp6c7AJ9S9ERXa2dTGI/AR86cm0dXfJzSgYPn0jDP8qHDOFkzYjW94EvVcFMtHBHO1QU17STsdSXa8w8SVcu+kUE5HerL2gdtH80xo6Sj14H2COCilJEkPEqdUyuBjDxpqoEnHmxAcpaTdGoOhovn8HmMyunodwvToxrSiQLuKp/KyBvyH0LApNx9zApJLoFXXq66Jfmb6u4wIIvU20gUgjl6HoITbB4FyB0pnohEe8f2NK0Ffl+jmKGamQvk6wWz4rTYaIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIX5+vw0x9KYQdDWlnNbBhBVXVuXD7hgBxCULUA9Pcw=;
 b=jw+TEQdXtciC/DJjDHF+vevgIt2vk1lOLnSlpq/r/qpzSqqkGHlzUF0XbL6+3oeFAao/NoDW5vs5jEViMKtzB5GcaY7ZmjMFeVXATDyj2/bVj0tWId3ILr7Muw+FD70Of7Uq+otcEaktFtJ+RmI7zGMZknSQKJmQnhCKflIVJ5643TXlipsxdi6UeJSqkJDIGG2Tral0rGDtHiTm1Qd6vGsdhkhGbdt97h58CllP4A0vL/GE9Urc+LpyXQfxsBxH9bWyUr7q2dqms4FR43Xt+6TwKaxcsD7lZbM5yQjmqEZJJlWiOUWjvgRRJksurZCx7ZXB52Ni6ZluBIRa7WTTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIX5+vw0x9KYQdDWlnNbBhBVXVuXD7hgBxCULUA9Pcw=;
 b=HKTBiDFIeNXtYe7bcxe0EDAyHaOSIR5m5r5fL6pVfYPqF0R5O2sXoBiNdEbYj2lmWzv4b4/oV1DdA0XFLOEro3bKplX4wKi8VY+8HqhOeok1opdRDJII0U5c+Q5K1vsfJi016yRPhwIebaXzjQW+aBvxsNNcaCBRJ0pMzIZQDfo=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1736.namprd22.prod.outlook.com (10.165.90.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Sat, 24 Aug 2019 14:12:19 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::2d81:1469:ceaf:1168]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::2d81:1469:ceaf:1168%5]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 14:12:19 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        Hassan Naveed <hnaveed@wavecomp.com>,
        Stephen Kitt <steve@sk2.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "regehr@cs.utah.edu" <regehr@cs.utah.edu>,
        Philip Reames <listmail@philipreames.com>,
        Alexander Potapenko <glider@google.com>,
        Alistair Delva <adelva@google.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] mips: avoid explicit UB in assignment of
 mips_io_port_base
Thread-Topic: [PATCH] mips: avoid explicit UB in assignment of
 mips_io_port_base
Thread-Index: AQHVWoXw5+Vd+PNBCEKgACqVCJUm1g==
Date:   Sat, 24 Aug 2019 14:12:18 +0000
Message-ID: <20190824141213.svzmdr3pxdaqssuj@pburton-laptop>
References: <20190729211014.39333-1-ndesaulniers@google.com>
 <alpine.LFD.2.21.1907292302451.16059@eddie.linux-mips.org>
 <CAKwvOd==SCBrj=cZ7Ax5F87+-bPMS9AtGSxp+NWp_+yDCg4R-A@mail.gmail.com>
 <CAKwvOdkXLhEuLiQ_ukE75zEg=Sw5-4BLHHCFqcZ0oyTEX3pWTQ@mail.gmail.com>
 <CAKwvOdmGax-WgXeKEnTq8+Xe0+Z5d2k4_Ad1vw0uOiO2NJ0bkg@mail.gmail.com>
In-Reply-To: <CAKwvOdmGax-WgXeKEnTq8+Xe0+Z5d2k4_Ad1vw0uOiO2NJ0bkg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::25) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2a02:c7f:5e65:9900:8519:dc48:d16b:70fc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9752876b-9968-41df-5b1f-08d7289d129c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR2201MB1736;
x-ms-traffictypediagnostic: CY4PR2201MB1736:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR2201MB1736BD0E9BB0584FB75E109BC1A70@CY4PR2201MB1736.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(39840400004)(136003)(396003)(376002)(346002)(366004)(199004)(189003)(256004)(6116002)(4326008)(6916009)(8936002)(446003)(2906002)(5660300002)(6246003)(11346002)(486006)(44832011)(476003)(1076003)(14444005)(42882007)(71190400001)(71200400001)(7416002)(53546011)(6506007)(386003)(8676002)(6512007)(66446008)(64756008)(81166006)(81156014)(6306002)(66946007)(52116002)(6486002)(6436002)(99286004)(229853002)(7736002)(186003)(305945005)(53936002)(54906003)(33716001)(46003)(316002)(25786009)(58126008)(9686003)(76176011)(66476007)(66556008)(478600001)(966005)(14454004)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1736;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +r2WW3BVWTJiQL1DHDBesKVdOsvk9wK5IUUHttwsjKWi+IvCFTYu2b5b4jfdu8PknaQ5RLH7CRriwUnLCx/4X4cTG0MLzjsOLzZkh1xZQQPSheVJp85FHac8kz2Gle4JtuYg2EXerrbeU7QOZV5Ux9t2+43dOPr05+pz4ZgP81q6A4MEzhLDbRUrRILNL1nHSTTqdj9CxREGGEyTVR6rxtVa0dyslMJO5G7Jg1V0xpCj6X5LwaPl3fM9JegosfvwuApdXuXDQrhpyqMa9tNUsL0ellewDwG0kPghTJv8pJUTotXzwtll5IgI3HDjZ0+J+hYuCXXhK/mnz1bmy8bSFRX1YTwcKwuhxnzUOjt8rMOBP6VK/liOUHr9692Vya5+p5Holyrh2Uu52V84p4iZ9uBjsEyPAhQ4gUannDZThI8=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8FCBC784F52DCE4DA4603B274981971D@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9752876b-9968-41df-5b1f-08d7289d129c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 14:12:18.7985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OIzPbi/XgbtfoRvrHKt82YIiLO55OyXpaPwg/LyJ6xdVfHlYB/E7cAUUNE2a8FE6Phl+4I01VDg58EctjFzxBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1736
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nick,

On Fri, Aug 23, 2019 at 10:16:04AM -0700, Nick Desaulniers wrote:
> On Tue, Aug 20, 2019 at 10:15 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> > Hi Paul,
> > Bumping this thread; we'd really like to be able to boot test another
> > ISA in our CI.  This lone patch is affecting our ability to boot.  Can
> > you please pick it up?
> > https://lore.kernel.org/lkml/20190729211014.39333-1-ndesaulniers@google=
.com/
>=20
> Hi Paul,
> Following up with this link that explains the undefined behavior issue mo=
re:
> https://wiki.sei.cmu.edu/confluence/display/c/EXP05-C.+Do+not+cast+away+a=
+const+qualification
> Please reconsider accepting this patch.

Sorry, it's been a crazy few months & I'm currently away awaiting my
father's funeral so I'm working through a backlog & catching up on
things.

It will be a shame to lose the optimization opportunities const offers
us, but it is an ugly hack & so I'm OK with applying this. It's likely
to affect older machines more than newer ones (which tend to use less or
no I/O port access) so I'm not too worried about the impact, but if we
find it matters we can always try the fixmap approach I suggested
previously.

Thanks,
    Paul
