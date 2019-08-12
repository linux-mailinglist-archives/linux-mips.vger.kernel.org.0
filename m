Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE5B89664
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 06:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfHLErW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 00:47:22 -0400
Received: from mail-eopbgr810103.outbound.protection.outlook.com ([40.107.81.103]:2688
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725648AbfHLErV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Aug 2019 00:47:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvZLI8+oQxLIGjL63N3gwxjtythMb6Hm0vJzVp9mg3Y6Bf3kv5HVUAkbWbudJsXfHejTCKT3XD13mYnexq7aONbKQBbxbpyZFzUAVVy+o3WDwzpHk0wORk6e5ASGd1Z8IvebLynN386esRjt7BTD8/opHLNvOZxPRfeAwilkj36n/r6MBPLPBNvx8iEdIkQFL73cA55P9M1u6bMSCFUC9EiVMGo5oatprknleug7ynqvpFFTGTrAu4csGG5bxo/lVoVKNw19GXsUUv3lVOms+4cqmFi3t3v7NuNz0Fj9xu2sGTo4s+k7SbV/sl9FyD2OXiCJFZOaFQIQKOyRSWlmsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=600OC8eie1woCTMKQcwlX592dEb/QW50tKbkbqXBqac=;
 b=R8+j7nNYEC2QBaXPTih4twNpyAg2aqbD7iIvFDnBjZ6mPZhmf5QNttYghaQSMJr8fcFCLsG36iTf3YaV57qtaiHilxeCzhyLMNwhGdl6OcV04iJ0RYZCoYdq23vqITjUzXqOj2umkO0y/M4H0wN4tHVtyd1lFwxw7sdZzHgoo4B3lOFomZrbsfusxqbqj21CB9iz52aJ0u/H7/2HE+We4Kn6U4KQgHzNHieGOEIeWmSjvDfpgfhs8WO6lumEJkJRSPqdz7xEYR3VZKE2UT0MHP/ISC1dKarSl1wlBD1ZcPLZnYTF1lueN4u9lP+C3iyZ9H5klkmS2YExaVtLJ1Vddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=600OC8eie1woCTMKQcwlX592dEb/QW50tKbkbqXBqac=;
 b=KKTYzklPTGZRmQL/rIPcngY18RQgKPiADgdR2vNV+USKhgw3udN/nO4lXMYc97hfCQ6UcDmPEST+oqX0VneLHv2kXHhEr2oxWNvQRGletr+S5vd8Joa462YVJxBv63J3pFoqkGbsmKhxuGXVfXABfbevDqlXLp1Z+2hcMBP+Cf8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1469.namprd22.prod.outlook.com (10.174.170.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.22; Mon, 12 Aug 2019 04:47:20 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 04:47:20 +0000
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
Subject: Re: [PATCH 2/5] MIPS/ptrace: Update mips_get_syscall_arg's return
 type
Thread-Topic: [PATCH 2/5] MIPS/ptrace: Update mips_get_syscall_arg's return
 type
Thread-Index: AQHVUMkFJUA2gB3zTEG/0sWsQvg0eA==
Date:   Mon, 12 Aug 2019 04:47:19 +0000
Message-ID: <MWHPR2201MB127735989B4545BE3F64C566C1D30@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190812033120.43013-3-natechancellor@gmail.com>
In-Reply-To: <20190812033120.43013-3-natechancellor@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2601:646:8a00:9810:9d6:9cca:ff8c:efe0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22c75ca8-3edd-43a1-5a46-08d71ee0282a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MWHPR2201MB1469;
x-ms-traffictypediagnostic: MWHPR2201MB1469:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1469991CC773E2FB5DF28D6BC1D30@MWHPR2201MB1469.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(346002)(366004)(39830400003)(396003)(189003)(199004)(6306002)(81156014)(81166006)(8676002)(14454004)(9686003)(99286004)(446003)(7736002)(11346002)(42882007)(486006)(966005)(2906002)(476003)(25786009)(478600001)(8936002)(54906003)(229853002)(55016002)(6916009)(6436002)(1411001)(102836004)(52116002)(316002)(76176011)(71190400001)(71200400001)(66946007)(7696005)(64756008)(66556008)(66446008)(386003)(15650500001)(6506007)(186003)(66476007)(74316002)(256004)(14444005)(6246003)(46003)(33656002)(5660300002)(52536014)(44832011)(6116002)(4326008)(305945005)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1469;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Nm20rIrc5vqChLvZ48osxILkQqj18Kf0p48gCHWiDCMSys6N3W3xXmD8S6h2ZK2Pa9+ZsW1yw3hvP3ZdOAdpRAX3B63Wb1YCZctWHWlczboQ21wmHP9/9quxgQO/mRxzfSDQ9c6LSURitXwqhpgn7AF2nYfmUZZiQOsj5F+hfi8WJpC2ez9gRF+Xt+f7wyyw1d+bm4u6QZq/Ku7Oy1fPCoBdb9Rc//A3OgebpyEgnn09aKddt48PFjJEAstdpQUBWc3nsvCVvz/iFeT8hWt6X5+G7QZxHHS90628zE4jr2aD9r6FpdOtI3mza/ogIvWPy6NvDDS3JmeOglH9kPCJPuJrfwkA35yEpMLhIEYGkc2j0i4ckBGG+mSY//XVnLokuapQ3Nuuqwgc/AC1Zg0SGQwdi0nFRtj21Z+v1xgEHvI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c75ca8-3edd-43a1-5a46-08d71ee0282a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 04:47:19.8543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oIlIb3+tiHt9kJSlExozhGD8jxNSOYX+PH0WsmB8c7zL5NFNtzh12UyqGq4+NwSciHguzyerk0v+dENwou3GWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1469
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Nathan Chancellor wrote:
> clang warns:
>=20
> arch/mips/include/asm/syscall.h:136:3: error: variable 'ret' is
> uninitialized when used here [-Werror,-Wuninitialized]
>                 ret |=3D mips_get_syscall_arg(args++, task, regs, i++);
>                 ^~~
> arch/mips/include/asm/syscall.h:129:9: note: initialize the variable
> 'ret' to silence this warning
>         int ret;
>                ^
>                 =3D 0
> 1 error generated.
>=20
> It's not wrong; however, it's not an issue in practice because ret is
> only assigned to, not read from. ret could just be initialized to zero
> but looking into it further, ret has been unused since it was first
> added in 2012 so just get rid of it and update mips_get_syscall_arg's
> return type since none of the return values are ever checked. If it is
> ever needed again, this commit can be reverted and ret can be properly
> initialized.

Applied to mips-next.

> commit 077ff3be06e8
> https://git.kernel.org/mips/c/077ff3be06e8
>=20
> Fixes: c0ff3c53d4f9 ("MIPS: Enable HAVE_ARCH_TRACEHOOK.")
> Link: https://github.com/ClangBuiltLinux/linux/issues/604
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
