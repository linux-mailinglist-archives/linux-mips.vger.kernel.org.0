Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA2725A199
	for <lists+linux-mips@lfdr.de>; Wed,  2 Sep 2020 00:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgIAWmc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Sep 2020 18:42:32 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:34202 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726112AbgIAWma (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Sep 2020 18:42:30 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
        by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 081MgJQX031353;
        Tue, 1 Sep 2020 15:42:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=C4uHPjxdR+bjb0CEGriCwqfnQXJOSsZ/OvIwbsuPu3k=;
 b=GvXW+ltrKf/5HzDfauSdXU7rnd8fvV9ToFwypZHeJG5W50ZIA9ecv7BbTkPkRQGn8H75
 AyayXbXACaUG12Pye88DUhJugL8ly6OZpw7epsGGBEBxiwE16RWv7elj8z5eKWxJlUrA
 iWE2z7VKM3185yxjlQyY2QVLfodCMDP/Otc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by m0001303.ppops.net with ESMTP id 337jpngvd6-9
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 01 Sep 2020 15:42:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 1 Sep 2020 15:42:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtLXtuOAsXlOOTwdrif1uPSmBK5F08hmwn7sEa/fhTGWwTaiTOe2jKVL4DhAf9rSu1BbbR6kdyHNQWUbWBb/w1kjGnu5M1QJW8XDDKVBSy5QD69Lxa6J4lYGb5B/XFxeJpQJ1u/A+5/vPSrxrRnxqB5tzrBnoh7PrFUQJRRJUWh9qC6T0/sJXjEhi2WmWuJwhkxibu9FaxFUKPE5oKSqAwtNxG878dso2wq+1j5r9Z+sFwWu2roKwVB3A4nmvIsmjX0nMUf5zDcMenb1ZsF7KoJIXDxv0gZkbSUZISvMIXvRPWFNCEXLvG/UUr1xY4Rj6GzISLqIChDOscP4MZOd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4uHPjxdR+bjb0CEGriCwqfnQXJOSsZ/OvIwbsuPu3k=;
 b=OzR8whSy1tnvLnFzjfZZC1CYEXd7nY4q/PvRvJPZqX9I7rFE9HN+lOiKFj4YH38Tvgbk24baySD3ZlUJG06/6MEnTs9of0u7yW1RjEhp7pyYuTzw982aAxvBSkjD4+seKihK+JLFuGfJsIfo0zucKzXZ/ed9HSVN5AfMlBSnthUMMHa4f3goiguhk/5nm8/7LaBywnM3rb2TNIwY0j4Zd15ZkJ6xE7MZeaTxTieVXKnOcmls4g+FicZWG7V3l6ndzHxn8upkUsqsN4r2s5EpBAxit3cScLK6CGKnxVMg6YyRIzpEOb9pk2oGrTxdG5p1JqQvA4Ae/2XH8ZpLi4i5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4uHPjxdR+bjb0CEGriCwqfnQXJOSsZ/OvIwbsuPu3k=;
 b=hhqCSvtAdqzYe6cWUe4QfanLDw1DtrkfgqGP6YIcUR5tonum0Ip9K/j1jQabRxHiKLDPbwwyZL3XNjgHt20fbX/F43Chs2ZACx9ZZGzyfKasA+D6WkN0Z7rQQJXng5zdqaGmsKu2U4EXEn5pvP+/DxJMH12CtPg26g0LLbE/iJk=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2950.namprd15.prod.outlook.com (2603:10b6:a03:f6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Tue, 1 Sep
 2020 22:42:08 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea%3]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 22:42:08 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "od@zcrc.me" <od@zcrc.me>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] lib: decompress_unzstd: Limit output size
Thread-Topic: [PATCH v3 1/2] lib: decompress_unzstd: Limit output size
Thread-Index: AQHWgGwCgxByMrx6Qka7tKhSQVK176lUYWWA
Date:   Tue, 1 Sep 2020 22:42:08 +0000
Message-ID: <747B4847-08E5-40C9-927B-E1BAC057CF46@fb.com>
References: <20200901142651.1165237-1-paul@crapouillou.net>
 <20200901142651.1165237-2-paul@crapouillou.net>
In-Reply-To: <20200901142651.1165237-2-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: crapouillou.net; dkim=none (message not signed)
 header.d=none;crapouillou.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:5c3c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9349a92-7507-4ad5-4665-08d84ec84270
x-ms-traffictypediagnostic: BYAPR15MB2950:
x-microsoft-antispam-prvs: <BYAPR15MB2950E2708C9714763025D486AB2E0@BYAPR15MB2950.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C/ILFhrGf+W9k9yYoFep3NYw2kMCxOh5HTrcGynjB86AuLgpn3aTMQVF7SROdR8sFUP9IcG4saIJKL36Dv6VE7Tqv0fX8dFcLwTYwTMBcx8zy588Ju/DGFh3H4by7yz/cUDMRif/A4VoxoUmIrpSt7ftq8YcZoFPMoCmkXIdQj5u+saX9nn+Z+Dd8NYI+BKQgJMwEdcQqQCAKH5UOUSOeD3Fb8z+sW3f7XmQFje35FnE3CmGTwtG4E1HNBG4XIflLe4EyaC/+TOgQoDYAeDVWT1+XA1arPkaLmPHJjKh317FCjjXLVy1xWovfDVu55/H
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(136003)(396003)(376002)(346002)(83380400001)(2906002)(4326008)(66446008)(54906003)(53546011)(66556008)(64756008)(6916009)(186003)(6506007)(6486002)(36756003)(478600001)(71200400001)(8676002)(66946007)(5660300002)(2616005)(6512007)(8936002)(33656002)(86362001)(66476007)(316002)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: lm11pw/lbEvytKCqq+NoGDmL7KZLdRUKyf89Y62CA5ZW3TQ6HXqTxhCOJM7/0JNy/tiq2hn2+xfoE5PJPvG1AWqm+Ak8AJVPpeTFF+idzPZUaO+gn4t5SzJAd4pATSFnVnk7fHyaa6EvpSO9zf2pXC2XQZ37bD56wNR6H2fm8whFrYqlgeGfQ/H/yUOWUgPasFyi6U10pbW73uvrWrvNN+DYfNzLUOA8d4PZ+u/KwpXxNOc3k011RQdPidvNtE5PSlel8qbn/eoxzFyoJPvq+S24bMJbovTHY0JilNMCXlPnz42nnWyWaNnvS7cKm7WL6Om/YANoW0/vxbyjaZo2iT2LF14FKImH+L/dpR4BjijGbpLj8QyCogeu8pjRMpu2jxiQ97Bl2G4ieSn/wuml0WyNjoM0ZUvoePOHsjUhhbamjLtA5uvLKTDE1/hzUgl0PXtOe5w4aFW6TL8RNCtc2dkMBRnZ2DgthH1PXpI0cXMpRkI84RPNBxgkWzG5tWNj/akAue5et/8Q4ncbOeAW/r4li8VFULxfOvBcjPs4YAlVkiDU9TfgpB+pwzN7yWGvMMbSJxnAIL1hO1r7HYHqthrhu7ThzCqhR5o57mO2VAi8zp0jxYOpL7rerDeoYi+QejcHyULG0/iknUmhWAHFNs9qx/vzqyLQSfCyRKGV6meQiTLQUPriYW1PTFClEw1L
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <89AA661875F82C44BD6E153981C3C528@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9349a92-7507-4ad5-4665-08d84ec84270
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2020 22:42:08.5506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Drt6I0u+LlGpKmyc1QigMeyV9j0pOnbR/H6IlSi7hj+yPMjKJsUb2CXFuG/PH6T8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2950
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-01_10:2020-09-01,2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009010190
X-FB-Internal: deliver
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


> On Sep 1, 2020, at 7:26 AM, Paul Cercueil <paul@crapouillou.net> wrote:
>=20
> The zstd decompression code, as it is right now, will most likely fail
> on 32-bit systems, as the default output buffer size causes the buffer's
> end address to overflow.
>=20
> Address this issue by setting a sane default to the default output size,
> with a value that won't overflow the buffer's end address.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>=20
> Notes:
>    v2: Change limit to 1 GiB
>=20
>    v3: Compute size limit instead of using hardcoded value
>=20
> lib/decompress_unzstd.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/decompress_unzstd.c b/lib/decompress_unzstd.c
> index 0ad2c15479ed..790abc472f5b 100644
> --- a/lib/decompress_unzstd.c
> +++ b/lib/decompress_unzstd.c
> @@ -178,8 +178,13 @@ static int INIT __unzstd(unsigned char *in_buf, long=
 in_len,
> 	int err;
> 	size_t ret;
>=20
> +	/*
> +	 * ZSTD decompression code won't be happy if the buffer size is so big
> +	 * that its end address overflows. When the size is not provided, make
> +	 * it as big as possible without having the end address overflow.
> +	 */
> 	if (out_len =3D=3D 0)
> -		out_len =3D LONG_MAX; /* no limit */
> +		out_len =3D UINTPTR_MAX - (uintptr_t)out_buf;

Great, that works for me. Thanks for fixing this!

Reviewed-by: Nick Terrell <terrelln@fb.com>

> 	if (fill =3D=3D NULL && flush =3D=3D NULL)
> 		/*
> --=20
> 2.28.0
>=20

