Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1B3D3323
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2019 23:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbfJJVEW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Oct 2019 17:04:22 -0400
Received: from mail-eopbgr800092.outbound.protection.outlook.com ([40.107.80.92]:23435
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726771AbfJJVEW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Oct 2019 17:04:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMMLKo2DpIr8hJjXmUETyASsX087y5iJ48NVjQ72O/J15OC34kmEQsjZBKaXltk7jx1DvmrSjlAAk1ZX3h/I+PzDG92pQ626CdZRyYMSyufmIfdXhqWwXJ/GKBQ+Kj6AMrAPCJyboWTsq5yZTx1XsQamuKbWPFq4P+X99+QU0qva/zVlzcTlblylOQPD8IP6BMR2n0Q7G6ARYAYiKSHO5FZ+MxvirXj7wDaBZqWVJBkvbIFcbR6mUaytirp5ql3X/J5mzhunYZ1rPapg0mrdfJj0Lsyy1ggzSZArKYFrz7J3sUoO8VvVzYpNzzWzWIuuiHUsH6zNr1BvRpKZeyaB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVuabfptiIWt/GI8zF1cdxWFCRC947kXoYbzqcQXcu4=;
 b=JjtPjPMo0/1duSvFhugQ5hRzvyrU3Vv18diMen9vwr2Zme1ihormEqZ7G9Np4SCAHSMR1uZENvLzbOQzVoKoaDofZ7oYEgz/kCXA7nZmnxZnAQK9eysVJ+2VwUQAcN9SBVUMRqlIH318dMcKNe0+3iw9WMNcV3+c9ry9swSNgf9aKMKm9nkGIi9GUM2iTJ0ijBwcCFKzybJnT9l02naqslMF/Jw/SKEy6Rm9jpwny1tOleck05Bfo+jTSOEPNAh15XgnDzgnGnxWgkHC9eEU/+qxqooHKWVnfEZo5NStXl5ZH6eGdLldXrSd6/bOGjhH5Pycz5/wx+FaZiALWmEE2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVuabfptiIWt/GI8zF1cdxWFCRC947kXoYbzqcQXcu4=;
 b=m6nB5x2DM8pGpacpIps0IkgOXkLMcXwOGuaurlDaN4wzUV0rDuGMCwiBtTre6gyKZOHxc/W5StKyLRR8PHmirKhCHtkXuQHxh+hHaD9y3bY4kr60ULqCXdjiX9TbIu/aAsAbHXS3XMh5qlJsxppH7ohA+94ePxURhicgv/NH6dA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1279.namprd22.prod.outlook.com (10.174.162.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Thu, 10 Oct 2019 21:04:19 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 21:04:19 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: cmdline: Clean up boot_command_line
 initialization
Thread-Topic: [PATCH v2] MIPS: cmdline: Clean up boot_command_line
 initialization
Thread-Index: AQHVfvakEZWwkg8GUEarRbAGv/lFGadUXqCA
Date:   Thu, 10 Oct 2019 21:04:18 +0000
Message-ID: <MWHPR2201MB12773E93EA4031F85118B0BAC1940@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191009230936.2290413-1-paul.burton@mips.com>
In-Reply-To: <20191009230936.2290413-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::22) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 362104b1-111f-48e4-a64d-08d74dc56a55
x-ms-traffictypediagnostic: MWHPR2201MB1279:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1279C22465F057FEFCA18405C1940@MWHPR2201MB1279.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(39840400004)(136003)(346002)(366004)(199004)(189003)(71200400001)(966005)(11346002)(446003)(71190400001)(486006)(478600001)(256004)(54906003)(99286004)(476003)(4326008)(14454004)(44832011)(66066001)(66946007)(66476007)(66556008)(64756008)(66446008)(42882007)(52536014)(5660300002)(102836004)(8676002)(81156014)(74316002)(81166006)(26005)(7696005)(52116002)(305945005)(76176011)(3846002)(6116002)(6506007)(186003)(33656002)(386003)(316002)(25786009)(6246003)(6306002)(55016002)(9686003)(7736002)(2906002)(8936002)(6862004)(6436002)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1279;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vW8bGbsZurGqZTSqHhlVohQ3cm3IFx6HSqdcmehuMqSPBC1xfVCIHY5NuhHoN9pVsvRJ0AkgiXLRdB5UAw77+Gws9NDTNeohsGs1PnWAV72uUpyND/AS/H0y5UoalsIyc/HTTsweEYapgisxnAwevyUuoDqxaXhS5TaOG/9IXyOySb++T648yXClNM7vkXpI6fjhG9zsfyiRIgOtwoiCesSQxOt8A56H1IX9THoYWsP2YmA2Iy6g5kPhmyTKzZ1UDF4JBd7Sj/TUolaUjCWLk4JT7qOWcZgfQffchFINcDgBSKhaDrSuSwaC81v4/723kSK/8mBuETxsBo7tJwCgzpoAm32PhU7fbXtKM2CNzkVnGRkLwoiBI6MAJ4h9vRB3ANvYcgN8/X3ebk6/hcTmFWvD0td0WjcabqumxbWx5F/YCYu5IIy3mf4OWhEH/gO6GgMkPy47495+k4SK/2qsZw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 362104b1-111f-48e4-a64d-08d74dc56a55
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 21:04:18.8326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TCnClw9w/hpSlmluLcn5CisOtee07uiexYwMizrA9U6V5pYe6+YXUeuFzm2JRlCGAEsW6qJp9bICjif+6OFemw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1279
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> Our current code to initialize boot_command_line is a mess. Some of this
> is due to the addition of too many options over the years, and some of
> this is due to workarounds for early_init_dt_scan_chosen() performing
> actions specific to options from other architectures that probably
> shouldn't be in generic code.
>=20
> Clean this up by introducing a new bootcmdline_init() function that
> simplifies the initialization somewhat. The major changes are:
>=20
> - Because bootcmdline_init() is a function it can return early in the
>   CONFIG_CMDLINE_OVERRIDE case.
>=20
> - We clear boot_command_line rather than inheriting whatever
>   early_init_dt_scan_chosen() may have left us. This means we no longer
>   need to set boot_command_line to a space character in an attempt to
>   prevent early_init_dt_scan_chosen() from copying CONFIG_CMDLINE into
>   boot_command_line without us knowing about it.
>=20
> - Indirection via USE_PROM_CMDLINE, USE_DTB_CMDLINE, EXTEND_WITH_PROM &
>   BUILTIN_EXTEND_WITH_PROM macros is removed; they seemingly served only
>   to obfuscate the code.
>=20
> - The logic is cleaner, clearer & commented.
>=20
> Two minor drawbacks of this approach are:
>=20
> 1) We call of_scan_flat_dt(), which means we scan through the DT again.
>    The overhead is fairly minimal & shouldn't be noticeable.
>=20
> 2) cmdline_scan_chosen() duplicates a small amount of the logic from
>    early_init_dt_scan_chosen(). Alternatives might be to allow the
>    generic FDT code to keep & expose a copy of the arguments taken from
>    the /chosen node's bootargs property, or to introduce a function like
>    early_init_dt_scan_chosen() that retrieves them without modification
>    to handle CONFIG_CMDLINE. Neither of these sounds particularly
>    cleaner though, and this way we at least keep the extra work in
>    arch/mips.

Applied to mips-next.

> commit 7784cac69735
> https://git.kernel.org/mips/c/7784cac69735
>=20
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
