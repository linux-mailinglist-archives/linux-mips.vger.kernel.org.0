Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20C08CC2E4
	for <lists+linux-mips@lfdr.de>; Fri,  4 Oct 2019 20:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfJDSrF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Oct 2019 14:47:05 -0400
Received: from mail-eopbgr730096.outbound.protection.outlook.com ([40.107.73.96]:56475
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725932AbfJDSrF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Oct 2019 14:47:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsDAs7NaOAAKWeUS2nh1ts1cwq1jqDV3JzM0cNpQQTgQBzyqxOEEOg67oq0WOJkI6FC544fesz1Nl4wY8Jzq4CUQZA2bfIdLfPEtecCNj7kWOaabgW3ar9aglGrw34BxTy5YxvVDcws4+I1vi75oz/j1omVQoNLdEx30w/JR94HrbyZeBb7sOi3RDemYdFWMkAJNjp2n0IpAVXazjrmOiOHV0JctLIbfHVcN0zFF0uIfAb2SdjcHLZ/hio5vUBdxpmkudOP2tQxrz88/i+bDywRdPt3FFLM/P6wtoQhS/NRI9MRW5TUerTgBBrHOjlW9UuUn2drQkTVxTfldSsCR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6CFU8P5DI+v/Qj49hfgnVFviczTK0SPRk0bPcTXDYw=;
 b=D0HR1cQQRdw6w3u6rvdA9kvHX36wTXuyeFBj8ARXO6SBixGuQdlr0XlsIlNrkv0gk/FZbSfc3xiHRWmz7lzhEtGbfiOIvJPyvzI11piCupe+QK5ETjIZMK7KQWMASvFQYHmzHXBIV/C49hakB3ZHBebab7ekavewTJ9PP+N+dnE+aSb6TJxtfGNhSvIavogDhfY6oHJob0zcW1a4M5KpPtbfvqo5HJEqQGbppIN3pVwxMAi9dIlj3LETLpp4pWJnUaKwZ3uR1untK0BGTRHthrRMJoK0PvKUuxyfxD2yRW7c95+wzz6Gbq0fd7Cpk1bAENuf+ckkILz7xxhKVTOy5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6CFU8P5DI+v/Qj49hfgnVFviczTK0SPRk0bPcTXDYw=;
 b=Obpea0q1cFk4SiVCbBYb7RgXKErkHo/Zai9u71IXryDaBVGu5QuxOqWr9Ur1xqEFaeBlI5TVF2rRMIYEoI02qdQ64Sq1EpP7Lj/WaGGay1bPj//7CSrQT9w0rML1erzrhWneaJBCLsc8QGrmiebgNby5PG7edcRfgGh9xvcgS7Q=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1709.namprd22.prod.outlook.com (10.164.206.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 18:46:58 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.023; Fri, 4 Oct 2019
 18:46:58 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: fw/arc: Remove unused addr variable
Thread-Topic: [PATCH] MIPS: fw/arc: Remove unused addr variable
Thread-Index: AQHVetrklvZj5AKU1kGTjJcxK1g0hqdK0nyA
Date:   Fri, 4 Oct 2019 18:46:58 +0000
Message-ID: <MWHPR2201MB12779D0635557E7F28AED6C5C19E0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191004174055.747288-1-paul.burton@mips.com>
In-Reply-To: <20191004174055.747288-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0042.namprd02.prod.outlook.com
 (2603:10b6:a03:54::19) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa2c8c0f-ba94-46f2-ee36-08d748fb3c89
x-ms-traffictypediagnostic: MWHPR2201MB1709:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB170902E9F31BF372E1E5A503C19E0@MWHPR2201MB1709.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39840400004)(376002)(346002)(396003)(136003)(199004)(189003)(42882007)(478600001)(33656002)(26005)(66446008)(66476007)(66946007)(66556008)(64756008)(6862004)(6246003)(52116002)(99286004)(9686003)(6436002)(7696005)(25786009)(55016002)(14454004)(4326008)(966005)(6306002)(5660300002)(52536014)(71200400001)(71190400001)(4744005)(186003)(76176011)(446003)(386003)(8676002)(256004)(44832011)(476003)(486006)(11346002)(14444005)(54906003)(316002)(7736002)(305945005)(74316002)(6116002)(2906002)(3846002)(229853002)(81156014)(81166006)(8936002)(6506007)(102836004)(66066001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1709;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YWhd3hryFvxw+FPygucr6Ng1rgs9/nrTzxFYoxJZK+QHGzmtkRtZuGBzWnSr235kNDa+7Y7PdQjyRZ3BrkgRk5X4a/VtJkFJZXhHnuXXPEnRSpnDGwU74L/5Zbrv7rFd0LFl0pQsbAkXPflClxvQBZ+EpQxPqK1I75Dn9tAehCNXZVasH14b+ngztUT0t15MKI4FvjaDrs7WdfgYhmD/kzuIqcC8s8rYm8YWLZmX82PIQOgChhPWEaW7ODwrpgM5P45I+Vhg9pSU7T+gxMfckKPBiW5XK7HUwpa/FNq46h0riD66AwncarlOxr5i9lOG5PRUDQ1a8M5VYn4HQJLeGoCZhXHXWNC7jBAw3IVZ9fxUK2sDFjPRfSa+e5zrlM9TzYpsIgVhtT2/wVITankE6eb2U6vLjj0YbXFc+UlnxpL8yUboT180uYhk56yLBnHNBB32OxXZGMJ6xyay00h2EQ==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2c8c0f-ba94-46f2-ee36-08d748fb3c89
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 18:46:58.7627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F4n69X7wfZhLgSj8agVtxNLxc45w0bWAjEjkwsRE6VGQtw98a4oeDM8z7tMz4q+u4EDraswmakTHrRKMI0fOOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1709
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> The addr variable in prom_free_prom_memory() has been unused since
> commit 0df1007677d5 ("MIPS: fw: Record prom memory"), leading to a
> compiler warning:
>=20
>   arch/mips/fw/arc/memory.c:163:16:
>     warning: unused variable 'addr' [-Wunused-variable]
>=20
> Fix this by removing the unused variable.

Applied to mips-fixes.

> commit 6822c29ddbbd
> https://git.kernel.org/mips/c/6822c29ddbbd
>=20
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Fixes: 0df1007677d5 ("MIPS: fw: Record prom memory")

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
