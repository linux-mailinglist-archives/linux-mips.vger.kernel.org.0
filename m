Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2E22509A2
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 21:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgHXTve (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 15:51:34 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:9124 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725904AbgHXTvc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 15:51:32 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07OJomaO021536;
        Mon, 24 Aug 2020 12:51:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=QOlXVb3cYpahMwaa+LOh6k9gDdQB9Q/QzThy+D8W2/w=;
 b=QeUDkVQr6nSHD3k+hw14B/mEyeEAQY9ce5MwErbPyWgqDW2FRD2+ICvH4ANPp5qXD6FD
 Tkf8tjVm4Q7KV/gCH6YHFWWcJT2ULRPOaYJ/ZOBtXQbSEIPQ/f8Y8v6jVuq7+y/42Lua
 LBDw9E81Rn0pvMkHoySLPP60ukLgdQEzxCM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 33313thjrx-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 24 Aug 2020 12:51:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 24 Aug 2020 12:51:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2oSS3OwOcKIpvQfmyAw7EaanS/8XqQeASOF1zq9nKrrAXH2lQVmQ0oGrg4rX58SaogcLvw9TrQo6TIGuWurqj+zdr/xxr1lVFgdXX2IsLhRESeSrSgjkJkqxCW1GBy3K02PEaVAp56JUkCP3cq9a4Z0qNE9LWqh+9NAEOQzfe4JfekfNlC1O+8XhX3V9dHvHWeiOLGy0nEsgoiQhdDbmfMJCAeJBtgMH4KNRgZSI0NBitcvodjqPSxXZxxh6Xn8Uf8Qf8tuy27C0q0LyZ3jUDgj0yswk+PCvjjRsSm7QH4EgY7Op4Y4gpdhL/UdyxlNyERRkAqpYVTUOsBN3KTFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOlXVb3cYpahMwaa+LOh6k9gDdQB9Q/QzThy+D8W2/w=;
 b=kdXhDNAJFT7Xvp2bA4yQA7r0ej4+r895FhQxF5scEnYq9d8yvL5p2o1ZWUaAK5n6o8q5eohsQUTfMxppi1RuwvHeeMMRpP29HGnGf+hmjCh7puRswStgvoe8ASKkoloCAn6wLhQyaBT3lxHx741bjCLCHGAY/PSyYHQudwtVyoH2jBFGJCAwrKpT8w7D7o+8mmFia17vUct+greRFVRqXRRlvxgs2zcNuKEpYQpMTczeFPFWtkg+A+fLm+UOWWSACmnnAlPghZGbHRt/lsUfeLYqe1noTfSVws/n4QcZvzgguG/w6eoJxF/ES0M/auCMUnT+dZU8iJYDet7ynjL37A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOlXVb3cYpahMwaa+LOh6k9gDdQB9Q/QzThy+D8W2/w=;
 b=CNcN8Ukyv0WcQrkoT/x+gySL+63biQ+/6ZT47XOwkY56E1Xj/ts0Nv5RJsp4AtRYKNEhmSbsRguo8CEkteugIu5FO+JtT3EPAvbWAnnD6rlGXJewZOXvxgi3O4xDUhvgpOKg1e2y4DuAY89tvqAdzA7l7FbLyOVD2B3PIZxq16k=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB4085.namprd15.prod.outlook.com (2603:10b6:a02:bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 19:51:23 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea%3]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 19:51:23 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "od@zcrc.me" <od@zcrc.me>
Subject: Re: [PATCH 2/2] MIPS: Add support for ZSTD-compressed kernels
Thread-Topic: [PATCH 2/2] MIPS: Add support for ZSTD-compressed kernels
Thread-Index: AQHWd9hubhseyyY4wEOiGjoaqbo/sqlHsDKA
Date:   Mon, 24 Aug 2020 19:51:23 +0000
Message-ID: <41742AA6-8BC0-46E5-8735-9B3D6E83FA2D@fb.com>
References: <20200821162948.146947-1-paul@crapouillou.net>
 <20200821162948.146947-2-paul@crapouillou.net>
In-Reply-To: <20200821162948.146947-2-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: crapouillou.net; dkim=none (message not signed)
 header.d=none;crapouillou.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:d050]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77c139c5-4f8b-4d0b-7608-08d84867147f
x-ms-traffictypediagnostic: BYAPR15MB4085:
x-microsoft-antispam-prvs: <BYAPR15MB408586FA4BFDFFCAB51D3C6FAB560@BYAPR15MB4085.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ng4ylNu1ns30qvlh53eF+Yy0iAoDbzBLQxKo8rGoHDsZ4UNKVJ+drKizuAbQW2TJ7YdQQ+IhhFxgi6wY5WZceC6doq6/ylQUh2gxkxBU0Vm3+BRolf458VyWDKbgQ8O68nIYYlb+a1M7WhC4pYGouO6dnKYp2JZ+/T3fdSQ30zTS/dzoHt4pNT1vhPdFW6FVL44htKBHddvupHBy51LJi8gJMvXGhzhYA+cm6n/I0Z7Yj+Nj5ZCuMANQmr7jPyVSMaSZhGFjiqpo9Eb2HMxVULJGrbibeJd1cD6VMPoKh840bxyP8CcOZqMxdEHZZtNbo6S3tO910T7oQThk6d8yK3Enb3BEmytQX5vkPR2uWhwP+oBxZWyhL9P0N6bj0/9k5U4FqvzoeYvAY4bHHWetMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(376002)(346002)(396003)(66946007)(8676002)(966005)(6506007)(2616005)(2906002)(36756003)(8936002)(186003)(33656002)(478600001)(316002)(53546011)(5660300002)(6916009)(6486002)(66446008)(66556008)(76116006)(54906003)(71200400001)(6512007)(4326008)(66476007)(86362001)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: PRw2VFx4H4ibIkJnOI9MJBXb0Aal55gMTsYisKfeLEhAcn4q+xzB8795y5Rdzx1167BYx0EV0IInHVE81GrkaMptMK60TMN9WTOLhod2rzF7RetMkdHtPT4oNH9ECAW1w523g/23tpC6F3fN86jumB8fv/du4K0ffv+9aryG/0OwpfnPlD0Vyqvbp00cxm24f2VpWpA4nHxroUkoEd6Y0q7CByvrO3otWag464TlPZdYCkHwGKieq35I0I2IddAGE72Jeo2rmMZOIV0zSlRTPFx3+CEwEgDQ/2DBEtJzyTUcghF7LCoN07vjL3A3MCycjzID/RPFadXg1hB3e3+av1Ljd6Bz12XfDIIgUhN/2XZ5KWZkcSuid9TbyUlSV1656Bc2lDHWcd/hXdRRqXNV1SRrHssZrXm0CPAicEdq/2EFTGw6P9IZrwgdG70bqRcR7v0w9kSwPdY8svMz69MkdbGLAK2vOEdELZcBngMMajgZwLnnRCxFJfPVotfnvutdnsqLCrU98BTL4BXvjhz+A8WpON3Vjjqxc18+YluLSKhqOvl0/az3KpzzShudqJM8+qPMtWZviBLyrF3n3JGxBgvbHnqp3oFqlxB9NATBOUJM8SJSy+Kby3IhdhouGvvs4fbtKzVwCBo+iGoqGbRg+n90H+BEF/TVEt/2fjnFyYkL/haAJOUun4vbprlle7fO
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9954655BC1F5E54D81A0886D832C3C0D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c139c5-4f8b-4d0b-7608-08d84867147f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 19:51:23.3995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0HbAqiJQJPB/dVq1xXRMBY09zn4MvOsG37pmx0i8Y9BBrL7EsYI6R4TYbxdK+hJ9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB4085
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-24_12:2020-08-24,2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240157
X-FB-Internal: deliver
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On Aug 21, 2020, at 9:29 AM, Paul Cercueil <paul@crapouillou.net> wrote:
>=20
> Add support for self-extracting kernels with a ZSTD compression.
>=20
> Tested on a kernel for the GCW-Zero, it allows to reduce the size of the
> kernel file from 4.1 MiB with gzip to 3.5 MiB with ZSTD, and boots just
> as fast.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> arch/mips/Kconfig                      |  1 +
> arch/mips/boot/compressed/Makefile     |  1 +
> arch/mips/boot/compressed/decompress.c |  4 ++++
> arch/mips/boot/compressed/string.c     | 16 ++++++++++++++++
> 4 files changed, 22 insertions(+)
>=20
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index c95fa3a2484c..b9d7c4249dc9 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1890,6 +1890,7 @@ config SYS_SUPPORTS_ZBOOT
> 	select HAVE_KERNEL_LZMA
> 	select HAVE_KERNEL_LZO
> 	select HAVE_KERNEL_XZ
> +	select HAVE_KERNEL_ZSTD
>=20
> config SYS_SUPPORTS_ZBOOT_UART16550
> 	bool
> diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compress=
ed/Makefile
> index 6e56caef69f0..86ddc6fc16f4 100644
> --- a/arch/mips/boot/compressed/Makefile
> +++ b/arch/mips/boot/compressed/Makefile
> @@ -70,6 +70,7 @@ tool_$(CONFIG_KERNEL_LZ4)     =3D lz4
> tool_$(CONFIG_KERNEL_LZMA)    =3D lzma
> tool_$(CONFIG_KERNEL_LZO)     =3D lzo
> tool_$(CONFIG_KERNEL_XZ)      =3D xzkern
> +tool_$(CONFIG_KERNEL_ZSTD)    =3D zstd

You can use zstd22 here. It will give you slightly better compression
without any additional memory usage. Also, you should add
-D__DISABLE_EXPORTS to the KBUILD_CFLAGS like x86 does [1].

[1] https://github.com/torvalds/linux/blob/master/arch/x86/boot/compressed/=
Makefile

-Nick

> targets +=3D vmlinux.bin.z
> $(obj)/vmlinux.bin.z: $(obj)/vmlinux.bin FORCE
> diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/comp=
ressed/decompress.c
> index 88f5d637b1c4..c61c641674e6 100644
> --- a/arch/mips/boot/compressed/decompress.c
> +++ b/arch/mips/boot/compressed/decompress.c
> @@ -72,6 +72,10 @@ void error(char *x)
> #include "../../../../lib/decompress_unxz.c"
> #endif
>=20
> +#ifdef CONFIG_KERNEL_ZSTD
> +#include "../../../../lib/decompress_unzstd.c"
> +#endif
> +
> const unsigned long __stack_chk_guard =3D 0x000a0dff;
>=20
> void __stack_chk_fail(void)
> diff --git a/arch/mips/boot/compressed/string.c b/arch/mips/boot/compress=
ed/string.c
> index 43beecc3587c..ab95722ec0c9 100644
> --- a/arch/mips/boot/compressed/string.c
> +++ b/arch/mips/boot/compressed/string.c
> @@ -27,3 +27,19 @@ void *memset(void *s, int c, size_t n)
> 		ss[i] =3D c;
> 	return s;
> }
> +
> +void *memmove(void *dest, const void *src, size_t n)
> +{
> +	unsigned int i;
> +	const char *s =3D src;
> +	char *d =3D dest;
> +
> +	if ((uintptr_t)dest < (uintptr_t)src) {
> +		for (i =3D 0; i < n; i++)
> +			d[i] =3D s[i];
> +	} else {
> +		for (i =3D n; i > 0; i--)
> +			d[i - 1] =3D s[i - 1];
> +	}
> +	return dest;
> +}
> --=20
> 2.28.0
>=20
