Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3599D1915
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 21:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730708AbfJITjR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 15:39:17 -0400
Received: from mail-eopbgr730094.outbound.protection.outlook.com ([40.107.73.94]:22078
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728804AbfJITjR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 15:39:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7wqOQOmzcGyk+xAHr+HmjuzwHbkhroMxfVIBrgOcT3+HcTA6e70o+ARQIFbVv7yMCCc84WaHh7nfSfdv7P4gY3w2zCVF8NJtTmAKL+A0NKPirMUKl5jckq3Vs1j3RDganUNLuK8loGC5m4ovNMZOlON7U6X3v5/qzfI+HkJ92rPE8ij6ZXCdHo1DzFckj3bSG5qQZChMK+ghaPXs0V9euxNXkeSB0sbsYgbjzGtRhI7GWBoqcR6QV5KCEMaA1WwcePY7pgh8R3skzgHbwxwpwClvq27zKw0AWBLX4ytntYM637otZPsHdNlqM4b/s90fAaXwXUnUb/kcPimKxgp0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2A8WkwoL5D1jlyrUTF7zTIEgMmhcs1YuwXgR1dKy08=;
 b=Z4XSKvXPSszQxznJAMnWjwxjI67fRWy1DizokiG+fBDAel2rQHVCfG/4e4RCRdHCAn7+mrVQRP7sS2oHzZfJ+ccMSYWX18yIjZi4O6JH+CAFVMvGQ7xCwxizvDeWvkIZnNBuh0BpLjwVeDvrWp9ZQDbytKLsfAELGpl7cKwCO3YwnhLVIs2m7/4mJTsX1y2rFcnJKTGPYLdKHLRKKnnLIQ/OL3Fcu22QYO0+mHTmD8lr5WIPw1YfisgbYjtMEF40lMNL8QqzkgV0A+WHgG5qwgAM3gMJsIiAN9abrYQei0EQlM2Jvl1NvNCIA8YTJgA9rTs4eWuk5tYhbHD3PrrsCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2A8WkwoL5D1jlyrUTF7zTIEgMmhcs1YuwXgR1dKy08=;
 b=lIYK9CwNkiKPCDtmHU50XHAS3ilVsXsu+5wY9cTZPH+DLzDZeqBpM1/u/VZ51NffmBJK+50DTOCtrUxurUypaDdY6/Kcg31q9USvi9yPq4D7Dv97hwd33l4/kNRJXdgmVp4rO64N5RnUQBTNpr1JnIKIXug1CTd8vda3YSmFMyI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1358.namprd22.prod.outlook.com (10.174.161.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 19:39:12 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 19:39:11 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: Re: [PATCH 1/4] MIPS: cmdline: Remove
 CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND
Thread-Topic: [PATCH 1/4] MIPS: cmdline: Remove
 CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND
Thread-Index: AQHVftk5/yfDqr7FH0WLV65y3YAPuw==
Date:   Wed, 9 Oct 2019 19:39:11 +0000
Message-ID: <20191009193909.nft6snedx6vb4qpm@pburton-laptop>
References: <20191007221951.1889661-1-paul.burton@mips.com>
 <alpine.LFD.2.21.1910091440050.25653@eddie.linux-mips.org>
 <alpine.LFD.2.21.1910091501580.25653@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.1910091501580.25653@eddie.linux-mips.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0057.prod.exchangelabs.com (2603:10b6:a03:94::34)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e48920bd-d03b-4a03-6804-08d74cf05bb1
x-ms-traffictypediagnostic: MWHPR2201MB1358:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB13582F33AC6EBA0F9B338C84C1950@MWHPR2201MB1358.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(396003)(376002)(39840400004)(346002)(366004)(136003)(199004)(189003)(316002)(14454004)(478600001)(186003)(25786009)(14444005)(6916009)(256004)(8676002)(81166006)(305945005)(81156014)(7736002)(58126008)(6486002)(9686003)(229853002)(6512007)(8936002)(99286004)(26005)(52116002)(76176011)(3846002)(6116002)(6436002)(6506007)(446003)(11346002)(33716001)(5660300002)(6246003)(66066001)(42882007)(71190400001)(71200400001)(107886003)(44832011)(66446008)(64756008)(66556008)(66476007)(476003)(4326008)(1076003)(486006)(386003)(66946007)(102836004)(2906002)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1358;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DlBBk8xEeFSXizv9zl+c4f5ZwcYIZFMqjdohssOlIhFdySThBt/+/5L6Go2+PHpwfBnbio2njYVk5McqVv0KyQBwAruY4HKdh9M9A0wIYAUgpGgwbUzt+lqvcfX2uKGDTi9jaACSPb2Bii8WTCnuvo8mkasAnOw5oy5RY695MWW3AnhUK70/8TgR6XPuBbzvfgdlzbosb1ylJUJt5n8OwFEP8hSTT14QGDmYl9BrKs8N5MHA2JASkHqaEuh5/Z2WZKVmUVhgnIlL9AhSHmHQxeDEGLLATtZE3RhjnvG3v2oAfq1Pp1DARiIc64cdYMia4neAUUxR+X4/MWgXpr373ZJ3xX7F/AYr7xTbbFsKzqPIm2OY0CenhS47MdHFhyaZzqvY3ZwqvhwlZNezDZcmaRptmgnAouTAvoGpI4t5kn8=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <26736BF57033B34088F164AB58C05F8E@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48920bd-d03b-4a03-6804-08d74cf05bb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 19:39:11.4967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3zPJWnAZFm5Q6ZhOTYZH/G5Lclv1B+cQYjXxgs/znrjFy7FvGH1m9dVQXi9ohtNj785zDLbWhpS/RyNSg3QZBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1358
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Maciej,

On Wed, Oct 09, 2019 at 03:13:09PM +0100, Maciej W. Rozycki wrote:
> On Wed, 9 Oct 2019, Maciej W. Rozycki wrote:
>=20
> > > CONFIG_MIPS_CMDLINE_BUILTIN_EXTEND is not selected by any of our
> > > defconfigs, so remove it to simplify the messy command line logic in
> > > arch_mem_init() a little.
> >=20
> >  That sounds like a poor argument for a functional regression to me.  I=
=20
> > have the option enabled in several configs I have been using just to be=
=20
> > able to temporarily override any built-in parameters with ones typed fr=
om=20
> > the console monitor's prompt.  Is it my mistake that I haven't put it i=
n a=20
> > defconfig?

For a "functional regression" sure. For removal of an unused code path
I'd say not, and presence in defconfigs is generally a reasonable
indication of use. The knowledge that you do actually use this is useful
information.

I'll note that I dislike the idea of overriding options built into the
kernel from the bootloader because:

 1) Some options just don't work that way & specifying them twice has
    unexpected effects, so this option gives users another way to screw
    up. But sure, a user will always be able to screw up if they try
    hard enough etc etc.

 2) As you say yourself a defconfig generally won't (or at least
    shouldn't) have much of anything in CONFIG_CMDLINE anyway. That
    means this use case requires someone to build their own kernel
    whilst explicitly specifying built-in arguments they don't actually
    want, which I'd consider somewhat niche.

Having said that if you find it useful I'm not against keeping that
ability, but I think we should do it a little differently by noting that
the option is essentially the same as MIPS_CMDLINE_FROM_BOOTLOADER apart
from the order in which bootloader & built-in arguments are
concatenated.

So I'd prefer that we handle this by either providing an option to
specify whether CONFIG_CMDLINE is prepended or appended to the
bootloader/DTB arguments, or perhaps by adding a separate
CONFIG_CMDLINE_PREPEND string. Either one of these should still allow
for your use case whilst also allowing the code that has to deal with it
to be less of an eyesore.

>  Elaborating, there's IMO little sense to set MIPS_CMDLINE_BUILTIN_EXTEND=
=20
> in a defconfig, because there's usually no default command line to set=20
> there in the first place, as this will be installation-specific.  Ergo I=
=20
> highly doubt the absence of the setting across the board is due to nobody=
=20
> (except for myself) using it.
>=20
>  Therefore:
>=20
> Nacked-by: Maciej W. Rozycki <macro@linux-mips.org>
>=20
>  NB DECstation systems use a DS1287 or a similar RTC/NVRAM chip to hold=20
> configuration and space is limited there.  Up to 37 of kernel command lin=
e=20
> characters can be permanently stored, fewer on some systems, and used for=
=20
> automatic boot.  Conversely when typed at the console monitor prompt ther=
e=20
> is no (known to me) limitation as to the length of the kernel command lin=
e=20
> requested.
>=20
>  Therefore a kernel configured for those systems will normally have=20
> several parameters embedded within itself while letting the non-volatile=
=20
> storage or user input extend and/or selectively override them, e.g. for a=
=20
> different root device or whatever.

That's a pretty awful limit.

My intent isn't to actively break these 30 year old machines, but the
cruft that has built up to deal with their limitations over the years
certainly needs some cleanup if it is to remain. Said limitations ought
to be documented within the code so that developers have a chance of
seeing why options like this exist - otherwise every bit of progress
will result in pushback from people using these ancient machines, and I
won't allow these antiques to be an anchor tied to the ankles of
developers making forward progress on machines that actually have users.
There are almost certainly some unmaintained ones whose time is well
past up.

Thanks,
    Paul
