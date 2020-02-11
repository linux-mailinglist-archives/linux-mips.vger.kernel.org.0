Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46B4A15956C
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2020 17:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbgBKQzu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Feb 2020 11:55:50 -0500
Received: from rcdn-iport-3.cisco.com ([173.37.86.74]:41649 "EHLO
        rcdn-iport-3.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbgBKQzu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Feb 2020 11:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=7335; q=dns/txt; s=iport;
  t=1581440148; x=1582649748;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=brm5vKduK0k6gkTwy+Jp6X4Ybzm1VuTWv2oA+58KdVM=;
  b=eYlzfTtkv1zl8TULGJnJXZeSbwvgRYxjCUIeO4fW62bLPWE5+20DiRlS
   QGNMqpIOIsCeALt+gD+9cNaLDGj+xrZqth7tI/1CzB+z/tM5wsdmWbo3v
   Fcla3P6TYu2ryau2Ylmz1VCGiB9BZ7zCnWOkbspoj3n7ishjoAwr59z1l
   s=;
IronPort-PHdr: =?us-ascii?q?9a23=3AvwjJNBf1HqYfbqmiUcq3OrOrlGMj4e+mNxMJ6p?=
 =?us-ascii?q?chl7NFe7ii+JKnJkHE+PFxlwGQD57D5adCjOzb++D7VGoM7IzJkUhKcYcEFn?=
 =?us-ascii?q?pnwd4TgxRmBceEDUPhK/u/bCU/EcJZV05N9HCgOk8TE8H7NBXf?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AYAgDA20Je/4kNJK1mHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgWoEAQELAYFTJCwFbFggBAsqh1sDiwNOghGJYo4wgUKBEANUCQE?=
 =?us-ascii?q?BAQwBAScGAgEBhEACgkckNwYOAgMNAQEEAQEBAgEFBG2FNwyFZgEBAQMBEi4?=
 =?us-ascii?q?BATcBBAsCAQgRBAEBARUZIREdCAIEDgUIGoMFgkoDDiABDqBoAoE5iGKCJ4J?=
 =?us-ascii?q?/AQEFhRINC4IMCYE4AYwiGoIAgRFHgkw+ghtJBBqBAkcCPYMDgiyNQoJehyW?=
 =?us-ascii?q?XbUQKgjqHTIpUhEeCSIgRkDaXUIIokBECBAIEBQIOAQEFgWgjgVhwFYMnCUc?=
 =?us-ascii?q?YDY4dDBeDUIUUgV2DYnQCgSeNPwEB?=
X-IronPort-AV: E=Sophos;i="5.70,428,1574121600"; 
   d="scan'208";a="706354089"
Received: from alln-core-4.cisco.com ([173.36.13.137])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 11 Feb 2020 16:55:26 +0000
Received: from XCH-ALN-001.cisco.com (xch-aln-001.cisco.com [173.36.7.11])
        by alln-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 01BGtPBU027840
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Tue, 11 Feb 2020 16:55:25 GMT
Received: from xhs-aln-002.cisco.com (173.37.135.119) by XCH-ALN-001.cisco.com
 (173.36.7.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Feb
 2020 10:55:24 -0600
Received: from xhs-rtp-003.cisco.com (64.101.210.230) by xhs-aln-002.cisco.com
 (173.37.135.119) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Feb
 2020 10:55:23 -0600
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-003.cisco.com (64.101.210.230) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 11 Feb 2020 11:55:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbjW/LZ+niTF4ajPC98KU09X57YK9jwy10WGzAm0H5OU/AfEk/IVHYdUScPlauQr8N0U5zFPJHjfTY1VYptiNt0oegB+1dXh9gY9AVI1bGxhBQAEebTS8EXYV2JJkEcfxWs2p7dXMg3KxR1rwQfrPY7d5QE0718sYhW8lzBefTf74KMLaSaWLylPFKqkPYbQAyWvb95KdaHIv5STt4lSkVX2kA5/YbWMfi1B4cS5zGHd52PQqJybAHWZTudDz73lJLLmyx+XEZ62D6pQrqerDxSX4ck816/jfvYcfBcHsVbBji1+bdAvxIBWf59sTOcAM5YFDKN+VtxWaJ3mfW2hlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpjVkjeXcAQRM+mIJPVNdC16peA2nBPzdJyyQgyStb0=;
 b=oLB/ZmSB+h6Du60cuFU2sS9E4cbQ1NLPDBZZWklNE+oXFnq1CINRyKyVgX9p8D72iYEhUWHeZrOc88+1iO4ssxRirJMJffCP/j8QYIOe9dBiRiYO6z7Y7MKjRDw5O8iA3kkteg6mO/daYlCbxhnCh1iNdwBaaw5ILEvKZ0Hj2vVp7Ym2rQaS9VkZq2vUncG4VF/fpPoSKLfk5XJmDPRwMGPg4Xt4zotthJ0QSDL/O4j0wVAj4oCRllbNKu58uasGTtyHuPTGwvFdi55yywsS98WT+tQyzez/Giq3VJQfHLE7VQ3kxoG0k3MKYUAemE/a/dPCgtwOOV6cRUoD/ZKt6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpjVkjeXcAQRM+mIJPVNdC16peA2nBPzdJyyQgyStb0=;
 b=eSsGpeTSaJn59fSfNmiMNp1S7W+kg/eNKwfNDM8EKnXwbvI/iMgj8FfxuyhUU/C8PAKOHQFtCV0Yu4bLfziAftpwcK+muNzRtcuM5AFMxkO43zmZ9ZecJxOztDwuNhdWR+8M5TQNDeGV0DImPTG27UHq4mm03iof0nnMNXCeVPw=
Received: from BL0PR11MB3219.namprd11.prod.outlook.com (10.167.233.23) by
 BL0PR11MB3297.namprd11.prod.outlook.com (10.167.235.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.25; Tue, 11 Feb 2020 16:55:22 +0000
Received: from BL0PR11MB3219.namprd11.prod.outlook.com
 ([fe80::f4ee:122a:9daf:1783]) by BL0PR11MB3219.namprd11.prod.outlook.com
 ([fe80::f4ee:122a:9daf:1783%7]) with mapi id 15.20.2707.030; Tue, 11 Feb 2020
 16:55:22 +0000
From:   "Victor Kamensky (kamensky)" <kamensky@cisco.com>
To:     Paul Burton <paulburton@kernel.org>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
        "richard.purdie@linuxfoundation.org" 
        <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 1/2] mips: vdso: fix 'jalr t9' crash in vdso code
Thread-Topic: [PATCH 1/2] mips: vdso: fix 'jalr t9' crash in vdso code
Thread-Index: AQHV2u078/VVzhEDo0WR9ouK+wmFgKgU1sEAgAAFNICAAAolC4AALZaAgAEYEJ0=
Date:   Tue, 11 Feb 2020 16:55:21 +0000
Message-ID: <BL0PR11MB3219D6C91AAD980EC3BFED14CD180@BL0PR11MB3219.namprd11.prod.outlook.com>
References: <20200203233133.38613-1-kamensky@cisco.com>
 <20200203233133.38613-2-kamensky@cisco.com>
 <20200210191424.brqyxs5lq7eqounl@lantea.localdomain>
 <20200210193301.ella5mokkudw3qgs@lantea.localdomain>
 <BL0PR11MB3219374C9349EE1B4F174777CD190@BL0PR11MB3219.namprd11.prod.outlook.com>,<20200210225229.4px5rljkici4mlrj@lantea.localdomain>
In-Reply-To: <20200210225229.4px5rljkici4mlrj@lantea.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kamensky@cisco.com; 
x-originating-ip: [2601:641:8080:3530::2353]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8a865e7-cfee-4f32-f85e-08d7af132ef1
x-ms-traffictypediagnostic: BL0PR11MB3297:
x-microsoft-antispam-prvs: <BL0PR11MB32970DB6FF5B0A1E393E710ECD180@BL0PR11MB3297.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0310C78181
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(189003)(199004)(316002)(53546011)(6916009)(478600001)(86362001)(6506007)(966005)(7696005)(66476007)(52536014)(33656002)(5660300002)(66946007)(76116006)(64756008)(66446008)(66556008)(81166006)(186003)(81156014)(8676002)(54906003)(71200400001)(8936002)(2906002)(9686003)(4326008)(55016002);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR11MB3297;H:BL0PR11MB3219.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K8uyIVwuZZfeVgOBs/hbUAgCLEK3xmjvwxBjqANY5Bmm0Q4fAsU+dFvokWBXr9VGZCSCWcxnVLBMWRKmC2a/iR6bA0iyH6li+BxOE8B4RJj/OzrFR7s3tEwHkSGLPlAzAYatrlYwgYVBsXsSEjlFaslCCKqX9Iu3vfFFlqRVZKmsG1eEyuEi9f/ptBunoBHGNsJy0X6Zpq0lgz7EQpAobCZm+AYhLSJFqvijW4v3YkFvO5lDvAJIPOe+v2JbIBTduvLZniXyNcmMGl34lZN3V2ydkmnJ9xQsRR1v5kZH5PGXVwmHZpaKo4R9ib6rwpeHfVN0Ganj0mrKmpr9b/pWC+XJdnxh8fg+kdlWbbZkhYzDQSW+pA7yqogaPsDipZ2acwXqT8Huvv3WtPcjhdJx4j8CQ80KQXqYeGa+96i6LlTT8u3sN/ZPtwK5uvi88xi3YipYIFcxB7OMR5MOLfADbfKFo6E6Speq56ePQTPFiMga6bq4qUiAbfBEUEjgT18zSst0ujxacF8QwB3fyl8DaA==
x-ms-exchange-antispam-messagedata: n7f7Yk07aTeWQHU/KGYwo+NdQ53v0dnxhiEZdhBUmUIlwLzEAVKR/MGV4ie6MUIOunfQZs9EGspqAYDKVNiNeMAHnSel3tfgEZi0kQ0MaAj4SGhUs9uxOHidguywBUswyUKN7EaSCIiz45ph6p3VYNlNnxUyw4U2twM/4te093XXA7D4Yu6lUGQr/5ssYEjZ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a865e7-cfee-4f32-f85e-08d7af132ef1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2020 16:55:22.0025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CBINXBztwvUyL2QRblS/QWWXYKYQyGiM7KCiUAhRfPW8++AJ+oKuUlpjkSZt/eTkrhAObdEwBgwV0Melj/VdEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3297
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.11, xch-aln-001.cisco.com
X-Outbound-Node: alln-core-4.cisco.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,=0A=
=0A=
Please see inline look for 'kamensky2>'=0A=
=0A=
________________________________________=0A=
From: linux-mips-owner@vger.kernel.org <linux-mips-owner@vger.kernel.org> o=
n behalf of Paul Burton <paulburton@kernel.org>=0A=
Sent: Monday, February 10, 2020 2:52 PM=0A=
To: Victor Kamensky (kamensky)=0A=
Cc: linux-mips@vger.kernel.org; Ralf Baechle; James Hogan; Vincenzo Frascin=
o; bruce.ashfield@gmail.com; richard.purdie@linuxfoundation.org=0A=
Subject: Re: [PATCH 1/2] mips: vdso: fix 'jalr t9' crash in vdso code=0A=
=0A=
Hi Victor,=0A=
=0A=
On Mon, Feb 10, 2020 at 09:12:59PM +0000, Victor Kamensky (kamensky) wrote:=
=0A=
> On Mon, Feb 10, 2020 at 11:14:24AM -0800, Paul Burton wrote:=0A=
> > Which kernel version did you find this issue with? Could you check=0A=
> > whether you have commit bbcc5672b006 ("MIPS: Avoid VDSO ABI breakage du=
e=0A=
> > to global register variable")? That was merged for v5.5-rc5.=0A=
>=0A=
> Ah, I just spotted your detailed cover letter - my bad :)=0A=
>=0A=
> Please try moving from v5.4 to v5.4.18 or higher, or just cherry-picking=
=0A=
> the commit I mentioned.=0A=
>=0A=
> Double commit that you mentioned is present in 5.4.15 (since=0A=
> v5.4.9) that I use. It is 5b004a238460113276319536534928c58d95e599=0A=
>=0A=
> [kamensky@kamensky-p53s linux]$ git tag --contains 5b004a2384601132763195=
36534928c58d95e599=0A=
> v5.4.10=0A=
> v5.4.11=0A=
> v5.4.12=0A=
> v5.4.13=0A=
> v5.4.14=0A=
> v5.4.15=0A=
> v5.4.16=0A=
> v5.4.17=0A=
> v5.4.18=0A=
> v5.4.9=0A=
=0A=
Right you are; I don't know how I picked up v5.4.18 as the version it=0A=
made it into.=0A=
=0A=
OK, so you're using v5.4.15.=0A=
=0A=
> You can check your tree: disassemble arch/mips/vdso/vgettimeofday-n32.o=
=0A=
> you would see 'jalr t9' calls, then disassemble arsm/mips/vdso/vdos-n32.s=
o=0A=
> and check that those 'jalr t9' places got converted into 'bal' instructio=
ns,=0A=
> even though t9 set up instructions are there. This conversion happens by=
=0A=
> ld during relocation processing if code was compiled with options I propo=
se=0A=
> to add explicitly. Walk through gcc and binutils places that do that are =
in my=0A=
> cover letter write up.=0A=
>=0A=
> You can reproduce the issue by doing opposite of what I propose:=0A=
> disable -mrelax-pic-calls and -mexplicit-relocs defaults in your=0A=
> toolchain by either using negate variant of option, ie=0A=
> -mno-relax-pic-calls or -mno-explicit-relocs or both. Something=0A=
> like in diff below. I've tried it on mips-poky-linux-gcc toolchain=0A=
> that got correct defaults and worked for us before, after adding=0A=
> no variants it shows the same 'jalr t9' crash as with other yocto=0A=
> mips toolchains.=0A=
=0A=
OK, I see what's happening here but I think focusing in on the "jalr=0A=
$t9" instructions as the explanation is misleading. Those aren't a=0A=
problem in & of themselves, but the fact that the GOT is being used is=0A=
problematic because we don't apply relocations for the VDSO. That,=0A=
combined with the fact that the VDSO is position-independent, means the=0A=
GOT can't possibly contain the right address for the function being=0A=
called & indeed contains zero.=0A=
=0A=
kamensky2> Created GOT entry and corresponding 'jalr t9' are for=0A=
kamensky2> static function call. I've tried diff where I add __always_inlin=
e=0A=
kamensky2> for do_hres and few other places in lib/vdso/gettimeofday.c.=0A=
kamensky2> When everything inlined I was able to get rid of 'jalr t9'=0A=
kamensky3> but resulting patch is ugly and size of vdso grew up to 40%=0A=
=0A=
I'm a little puzzled by how we got into this state of trying to use the=0A=
GOT without relocations though.=0A=
=0A=
kamensky2> Yes, I agree it is a bit perplexing.=0A=
=0A=
Does your VDSO image contain relocations? =0A=
=0A=
kamensky2> No, it does not. It would fail cmd_vdso_check that looks for=0A=
kamensky2> the same. Double checked manually - no relocations.=0A=
=0A=
Could you try running "objdump -rR vdso-n32.so.dbg.raw"? We=0A=
have a check in the genvdso tool for reloc sections that should cause=0A=
the build to fail if they're present, and I'd expect the toolchain to be=0A=
emitting relocs if it's using the GOT. GOT with no relocs makes no=0A=
sense.=0A=
=0A=
kamensky2> I did some digging - looked at glibc sysdeps/mips/dl-machine.h=
=0A=
kamensky2> line 209=0A=
=0A=
https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/mips/dl-mach=
ine.h;h=3D06021ea9abcfcc598b2204ce37d643a4809735da;hb=3DHEAD#l209=0A=
=0A=
kamensky2> new 3rd entry that got created in our case to call static=0A=
kamensky2> functions is so called local got entry and it is supposed to be=
=0A=
kamensky2> filled with 'start of DSO' value by run-time linker without any=
=0A=
kamensky2> run-time relocations present.=0A=
=0A=
kamensky2> Here is value of MIPS_LOCAL_GOTNO in dynamic section:=0A=
=0A=
[root@svarog-cisco-com vdso]# mips64-poky-linux-gnun32-readelf -S vdso-n32.=
so | grep .got=0A=
  [11] .got              PROGBITS        000009c0 0009c0 00000c 04 WAp  0  =
 0 16=0A=
[root@svarog-cisco-com vdso]# mips64-poky-linux-gnun32-readelf --dynamic vd=
so-n32.so | grep MIPS_LOCAL_GOTNO=0A=
 0x7000000a (MIPS_LOCAL_GOTNO)           3=0A=
=0A=
I also expect that reverting commit 4467f7ad7dbb ("MIPS: genvdso: Remove=0A=
GOT checks") would flag the problem & cause your build to fail. Perhaps=0A=
we should bring that check back & either special case lld or require its=0A=
users to have a very recent version of it.=0A=
=0A=
kamensky2> I've tried to revert it - it starts failing even in cases where =
it=0A=
kamensky2> used to work before: because it detects additional got entry -=
=0A=
kamensky2> pretty much original issue that drove 4467f7ad7dbb commit.=0A=
kamesnky2> We could improve the check with taking in account LOCAL_GOTNO.=
=0A=
kamensky2> But I don't see much sense in it: since for global got entries c=
ode=0A=
kamensky2> dynamic relocations will be present and it would be covered by=
=0A=
kamensky2> cmd_vdso_check ('objdump -R' check from lib/vdso/Makefile).=0A=
kamensky2> And when we allow local GOT entries we still would rely on=0A=
kamensky2> -mrelax-pic-calls magic of converting those 'jalr t9' into 'bal'=
=0A=
kamensky2> instructions.=0A=
=0A=
It would be good to submit a v2 of this patch with the commit message=0A=
updated to explain that some toolchains attempt to use the GOT without=0A=
these flags being specified, and even better if you can figure out why=0A=
that happens.=0A=
=0A=
kamensky2> I will add few sentences to my commit message explaining why=0A=
kamensky2> we don't have dynamic relocations for static functions case.=0A=
kamensky2> And as you asked in follow up message I will add those options=
=0A=
kamensky2> unconditionally.=0A=
kamensky2> I believe my second patch: build time check for 'jalr t9' in cod=
e=0A=
kamensky2> should still be useful, since it verifies that conversion to 'ba=
l' driven=0A=
kamensky2> by -mrelax-pic-calls does happen.=0A=
=0A=
kamensky2> Please let me know if you have any additional feedback before=0A=
kamensky2> I post v2 set of patches.=0A=
=0A=
Thanks,=0A=
Victor=0A=
=0A=
Thanks,=0A=
    Paul=0A=
