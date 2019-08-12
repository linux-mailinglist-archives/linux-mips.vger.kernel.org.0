Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 516C289662
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 06:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfHLErT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 00:47:19 -0400
Received: from mail-eopbgr810128.outbound.protection.outlook.com ([40.107.81.128]:47501
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725648AbfHLErT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Aug 2019 00:47:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RY1I6fdXgcDMWewXfs+7wOSQuIPU2znIPWHFn8a1r2tHTM42vIza5TLAiTVB8ZbJxdRFNix5kJypeVaShZ322rAFQ9OVDCZLNCUvoTSYJrOVpcY8NhQSuiaw4Gf6ldxHzxZp2Hes2cL7LkvHZ53S6vRDPI2xujrx4ohtnuqAqy/sULGhYsifuqYsGtXkx7BUN7on/W3dVAWra1Jf6TSncJ+WQrkp1b6Js5s50Bg+QIiqivtZ00dFk1uYtpilCOcWTR/MEA37kQbYmKQAlTTKw8qR/bcnETcoEoo2k2u7MAZPovDN/7vC4s6G3TFFLo8ylaBe60erikwO91+m/Nxzmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkQMtbiJfKoDw6+Yo1Jxt1v4dE8XQcIdBSjr0sAH3cA=;
 b=QmKUVMJeUR3lF98Jyq6xKXmCAhuSSwYeuxFbIqraEpqnwCd1KnRvy/aEL/V57iY9swMy1f9gJ3xXDozl0BhSJrn3TrwB+88b/EiOnFKVQ0V/bEXWqKVlzFo3xj/tRwqH+fXHiRbGlIYBirikxKfvnYUNlwrmOX5NAvPCjgp2mfEsxz++wRNQ42hz41W5xHU10ur3YJrFjE+j33q7K64eHFlOn04QN8CKRX1bvrfTe5qK5FPxdwkk4QC6l5jU3VRm9qGNfEUBVD7glpT8op+CUCM5gLloFZRYACTX2VQSUp2ztznl1phdqjHPkLfu2lv+iwDdpdsjGzCz8sMofdd3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkQMtbiJfKoDw6+Yo1Jxt1v4dE8XQcIdBSjr0sAH3cA=;
 b=Tbc+4AUz5RItrovO54wSMOrCzFvNbvgYuDJQ/cwMmg96ZGKH+ANZ7kaj16YVwBzHFFio27BbMdZ6t8YFx0sdjhFi/8LwhCvblAPFC9W+4UO2DhPhtlBULjTUnUb544z4HPjTyRjCSL4jKPoMvDSWVnIx6rbV2Vg+hKER5f07f54=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1469.namprd22.prod.outlook.com (10.174.170.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.22; Mon, 12 Aug 2019 04:47:15 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 04:47:15 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/5] MIPS: Don't use bc_false uninitialized in
  __mm_isBranchInstr
Thread-Topic: [PATCH 1/5] MIPS: Don't use bc_false uninitialized in
  __mm_isBranchInstr
Thread-Index: AQHVUMkDqKjwYqiFLUa9pBXZ514zBw==
Date:   Mon, 12 Aug 2019 04:47:15 +0000
Message-ID: <MWHPR2201MB127785F4CEC464CB6F11F3DAC1D30@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190812033120.43013-2-natechancellor@gmail.com>
In-Reply-To: <20190812033120.43013-2-natechancellor@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0026.namprd21.prod.outlook.com
 (2603:10b6:a03:114::36) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2601:646:8a00:9810:9d6:9cca:ff8c:efe0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 722b53c4-2284-4497-7c61-08d71ee025a0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MWHPR2201MB1469;
x-ms-traffictypediagnostic: MWHPR2201MB1469:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB14696740AE76D50BDB0F263EC1D30@MWHPR2201MB1469.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(346002)(366004)(39830400003)(396003)(189003)(199004)(6306002)(81156014)(81166006)(8676002)(14454004)(9686003)(99286004)(446003)(7736002)(11346002)(42882007)(486006)(966005)(2906002)(476003)(25786009)(478600001)(8936002)(54906003)(229853002)(55016002)(6916009)(6436002)(1411001)(102836004)(52116002)(316002)(76176011)(71190400001)(71200400001)(66946007)(7696005)(64756008)(66556008)(66446008)(386003)(6506007)(186003)(66476007)(74316002)(256004)(6246003)(46003)(33656002)(5660300002)(52536014)(44832011)(6116002)(4326008)(305945005)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1469;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BxULVD3sabcl04ntRCMNbs0Sz9X4Oa1MnhbqE6c5ROJm7MRXgGmDeuJGsoKLlTIcRaa7Z3j5pHYnsicVKKUwIIeXyXoKRvfKO4qyAE3NR3IP8ec103zy6wTI0yHx9envZjNUJHNmW+0moi4qJhmb+o8HT+HyKiGcfgg/gdXaVOkvBi2ZLojFke95zi+EzIJCBqjUvT2r4Mf0e2VVfBBDUHXQ0k+iu5ybVC9P7SsLfvRY7Et38ZhOmvj4GS8yXGpr1gOLUuftUmEJb9WEuoCl4aKDX22RrYk19S52kclcD7zepGBdWLsOJiREQNVWI8etD+HVP3SbuvEIyVzMxvI5b/F0kSvEBlQwKNijxKicv0oRYN1pg/651/eE16nD1DazZ3T/NNg9xLjFIOQ6rXqMI8J/FLuWUbE4YnB/d/jVjDU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 722b53c4-2284-4497-7c61-08d71ee025a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 04:47:15.0575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cp3xf5M7Tdn8v66dkki9TnD+V4dVwi++CXk/LAxwppcHkp7WRC9RMD95hXwaVqKZFUB48BiyV4B2qVGpY/5kVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1469
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Nathan Chancellor wrote:
> clang warns:
>=20
> arch/mips/kernel/branch.c:148:8: error: variable 'bc_false' is used
> uninitialized whenever switch case is taken
> [-Werror,-Wsometimes-uninitialized]
>                 case mm_bc2t_op:
>                      ^~~~~~~~~~
> arch/mips/kernel/branch.c:157:8: note: uninitialized use occurs here
>                         if (bc_false)
>                             ^~~~~~~~
> arch/mips/kernel/branch.c:149:8: error: variable 'bc_false' is used
> uninitialized whenever switch case is taken
> [-Werror,-Wsometimes-uninitialized]
>                 case mm_bc1t_op:
>                      ^~~~~~~~~~
> arch/mips/kernel/branch.c:157:8: note: uninitialized use occurs here
>                         if (bc_false)
>                             ^~~~~~~~
> arch/mips/kernel/branch.c:142:4: note: variable 'bc_false' is declared
> here
>                         int bc_false =3D 0;
>                         ^
> 2 errors generated.
>=20
> When mm_bc1t_op and mm_bc2t_op are taken, the bc_false initialization
> does not happen, which leads to a garbage value upon use, as illustrated
> below with a small sample program.
>=20
> $ mipsel-linux-gnu-gcc --version | head -n1
> mipsel-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0
>=20
> $ clang --version | head -n1
> ClangBuiltLinux clang version 9.0.0 (git://github.com/llvm/llvm-project
> 544315b4197034a3be8acd12cba56a75fb1f08dc) (based on LLVM 9.0.0svn)
>=20
> $ cat test.c
>  #include <stdio.h>
>=20
>  static void switch_scoped(int opcode)
>  {
> 	 switch (opcode) {
> 	 case 1:
> 	 case 2: {
> 		 int bc_false =3D 0;
>=20
> 		 bc_false =3D 4;
> 	 case 3:
> 	 case 4:
> 		 printf("\t* switch scoped bc_false =3D %d\n", bc_false);
> 	 }
> 	 }
>  }
>=20
>  static void function_scoped(int opcode)
>  {
> 	 int bc_false =3D 0;
>=20
> 	 switch (opcode) {
> 	 case 1:
> 	 case 2: {
> 		 bc_false =3D 4;
> 	 case 3:
> 	 case 4:
> 		 printf("\t* function scoped bc_false =3D %d\n", bc_false);
> 	 }
> 	 }
>  }
>=20
>  int main(void)
>  {
> 	 int opcode;
>=20
> 	 for (opcode =3D 1; opcode < 5; opcode++) {
> 		 printf("opcode =3D %d:\n", opcode);
> 		 switch_scoped(opcode);
> 		 function_scoped(opcode);
> 		 printf("\n");
> 	 }
>=20
> 	 return 0;
>  }
>=20
> $ mipsel-linux-gnu-gcc -std=3Dgnu89 -static test.c && \
>   qemu-mipsel a.out
> opcode =3D 1:
>         * switch scoped bc_false =3D 4
>         * function scoped bc_false =3D 4
>=20
> opcode =3D 2:
>         * switch scoped bc_false =3D 4
>         * function scoped bc_false =3D 4
>=20
> opcode =3D 3:
>         * switch scoped bc_false =3D 2147483004
>         * function scoped bc_false =3D 0
>=20
> opcode =3D 4:
>         * switch scoped bc_false =3D 2147483004
>         * function scoped bc_false =3D 0
>=20
> $ clang -std=3Dgnu89 --target=3Dmipsel-linux-gnu -m32 -static test.c && \
>   qemu-mipsel a.out
> opcode =3D 1:
>         * switch scoped bc_false =3D 4
>         * function scoped bc_false =3D 4
>=20
> opcode =3D 2:
>         * switch scoped bc_false =3D 4
>         * function scoped bc_false =3D 4
>=20
> opcode =3D 3:
>         * switch scoped bc_false =3D 2147483004
>         * function scoped bc_false =3D 0
>=20
> opcode =3D 4:
>         * switch scoped bc_false =3D 2147483004
>         * function scoped bc_false =3D 0
>=20
> Move the definition up so that we get the right behavior and mark it
> __maybe_unused as it will not be used when CONFIG_MIPS_FP_SUPPORT
> isn't enabled.

Applied to mips-next.

> commit c2869aafe719
> https://git.kernel.org/mips/c/c2869aafe719
>=20
> Fixes: 6a1cc218b9cc ("MIPS: branch: Remove FP branch handling when CONFIG=
_MIPS_FP_SUPPORT=3Dn")
> Link: https://github.com/ClangBuiltLinux/linux/issues/603
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
