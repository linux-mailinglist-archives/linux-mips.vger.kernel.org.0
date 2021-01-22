Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C282FFB1C
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 04:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbhAVDc2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 22:32:28 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28858 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbhAVDcU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Jan 2021 22:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611286340; x=1642822340;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=oleS2d9S80vR9pNcreZNeHd+Wy1LbAEFklM1Bt0150U=;
  b=AZp6IKD7pmfC0A6p7LtQFXfISrT5xm07SS8vqwgpcVjlJmkKaf7Dy2oi
   aXBrmS3LtkZJKQeFSIU0+hlNWtPQO7QAMzKr9c725inM8LpjZAgJzJaoP
   mQ8rnNToxpSJFGhlJnDeRw7k6BhFDBvgps5dzIOeNqDF8gtODglvq24fQ
   VyKDRpDHdHvf/YL60nyRHjzLaGtncBZBiKRSslCjc69Nzc6xy5kk/ChUE
   rUFpuIMxcKQ10hhc19fOWiaVLUqldQFfGsKqVQrML3XMjTs0aIuif2IrY
   9PLOoPfzftTk7ZbDNTF2Dh7YxnHg3PbAhz4SI6yPwgXYN3fq3wnWfODMm
   g==;
IronPort-SDR: IBIwFGN/erSoGPPvkINdcLKQmwKsG9UrmuNSalFr0eiVLRWlAKkqHOp1aUHF105uu1nRIfchgg
 MhWZ12WntOcZzH3uaqCu9TeJP+4+SmIc6w81riyELD+X7CM6VFJadF3yRf+993HridEZuzwhjH
 sK2H3GUJXoLSxS7FiSQA98KNC7D89Xb1pTS2yespaBvK3PNvycmaqsd3Myxd2av7O+nbi3sOP9
 jH3IHmm7sKqzeunD2zS0QQ2MoTBIpJ6tdg1LFS+lpapgoeJieLR0qAlTtKV2L07k8SsXdR2S4o
 +zs=
X-IronPort-AV: E=Sophos;i="5.79,365,1602518400"; 
   d="scan'208";a="268382877"
Received: from mail-bn3nam04lp2055.outbound.protection.outlook.com (HELO NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.55])
  by ob1.hgst.iphmx.com with ESMTP; 22 Jan 2021 11:31:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOEy15UmQANezoc9oZrw4xTnmoHGLLsBo89G/LzXq5kua6/bS2nJasT5gZiDqU7KjkzO4YlUPoEhasM30DftUsoZQA9fY1dG3SSsYQ0Kvd0JQ8dSSKOsAAKOK9Wc6OMoB+JcsNt+qekINb/1NFmfLg75xA0bnWAStkEfDcd8hDIthE9/P6wzEcR+5+3lQfTFYh5OerwtY71IpruZiHTEvN0w8XncpG6Arvj08cmPHWZp6AFUM0rO9T1its1MhrsvEeaRXV5bdVd4gp71zh8fFcg8N3l0Qj8hOHxmULbXmh4rtF/MBsishT/N/b94v6MTfFvcD8vZD5+s8WlU6IURzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9mo6xtr0mHYlLng64EdcMMJS62hh+ZMqJWsUuoRV7Y=;
 b=LbTCXJX2C5ErS3ACGZ/+q+1Q8tPvILUXammKBPU1NWsUduLSIPqtyMNJ7tymEOKJUMAe6dmBU1QRa6zgnxwlqS2qhRdk6wwlrA5BXygcSCpdau7Ibbr9JBd/cjd3362hQnTXlO7NpqhN74zJJJMjSZeVhKbzfU5YCzRSBkcJm1Dv90qxtQ4J3mP6mQT1NS72O3Nm29IeyQOynC4RSWPHrnhBZ517x32iQO8sInUGzEZnNNx8BAs3q43faSfF65VLu/xBPxqj+tcPaA4uQdxC+CTxPTquz3aHYy5yyRXvSdJCPk+O4aOv9VOr9QilTNLAqpLS9vJKto3T0BdnPgFNFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9mo6xtr0mHYlLng64EdcMMJS62hh+ZMqJWsUuoRV7Y=;
 b=Uw4krnzCkiye5l3mDLo/sA1xFjR559Pt2qYkJ0q1msGjVjdImegh2lPR4MgeYyVV5VYzp2cuG4GAmoJBt1vv5ZrI5aisgSv6GwxnDeRgJ3ilDZyg+RzRcFwOGf0ouykgw58nzIzdHjpq9OCSb0KCpsm35NXJ9y4KLK8LNWLshDs=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by SJ0PR04MB7693.namprd04.prod.outlook.com (2603:10b6:a03:32b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 22 Jan
 2021 03:31:06 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::716c:4e0c:c6d1:298a]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::716c:4e0c:c6d1:298a%6]) with mapi id 15.20.3742.014; Fri, 22 Jan 2021
 03:31:06 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Lauri Kasanen <cand@gmx.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Keith Busch <kbusch@kernel.org>,
        "hch@infradead.org" <hch@infradead.org>
Subject: Re: [PATCH v8] block: Add n64 cart driver
Thread-Topic: [PATCH v8] block: Add n64 cart driver
Thread-Index: AQHW7+7j81o2oc19D0iSKgHpidQYvA==
Date:   Fri, 22 Jan 2021 03:31:06 +0000
Message-ID: <BYAPR04MB496518897B33A294F2292EC286A00@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210121130205.d2810df601bd00536195c87b@gmx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmx.com; dkim=none (message not signed)
 header.d=none;gmx.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2600:1700:31ee:290:475:2d41:83ae:3ed5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 12ace6a8-5c32-40d5-83e0-08d8be86275e
x-ms-traffictypediagnostic: SJ0PR04MB7693:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR04MB7693A579901092967C3ABE6586A00@SJ0PR04MB7693.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:525;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i6f+D1nDrr4Dwt0P00HJHbaurz8jFwind7wO9MvaFzhLVLrcHaNwqC66JYsvLyVgXpzrFx4UCOpuulbBaW0YJP3wXqJtJ8eov+AgJ+AHzcvl4GiCH2q6hXL9ka5JyP6N0Eb7s/sJmwn65UZhY1kDAe9YsWDLVaeIOf1Oc1E7pGFGTLHqzX4XxCVn2fz3XTYWlsAcXJa9YBTDcwlCnOeC/k7Rzl9ZUHGgCqdk3fA40JtKF39qURXVChvGr+OLX5XL34uZwE7lw8w5u8AcMkPDEapXlzWdT6SP7lhqKu1twPv25SGm9VDfYhYxNTqduTEHq16UmAm5XsLTH6FAShGywQn5eRs+plrX5VG/XtYi5j/ROYpiQ3iYLFDnajT/q1CEY01nUnCJ19b5qf567w3Yhw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(8936002)(6506007)(52536014)(33656002)(2906002)(55016002)(8676002)(76116006)(110136005)(5660300002)(53546011)(186003)(316002)(7696005)(86362001)(71200400001)(4744005)(66556008)(66476007)(478600001)(66946007)(54906003)(4326008)(66446008)(64756008)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fiX+AWafahNBqNTo5fSfcgLfvikAKgd7Ak1HxrkYYwxObItf7BFr7uT7IaSp?=
 =?us-ascii?Q?Je2K9Oxj9ZmjbUrMupG3CL9ahEHTYnjDV9Rdnz8kxxX8C+0bwrsd4enJ1XXK?=
 =?us-ascii?Q?9Zp3j0P0yU6w91JYAHWCGWLHgl5AGjmxKcFWmN0Qim53UExTQE1r9CxyF52P?=
 =?us-ascii?Q?T4lsVec1RlpdzcNBOsO4rNA8caJnFYpxw1+HeQrYqRDcfquZ5ngYiZf9THMM?=
 =?us-ascii?Q?XLHWv37BD9/7JdsZ+H4i/EeBfcBzeneZeYNxDPHPzl4/8DGxzDjiRQ6XOxXZ?=
 =?us-ascii?Q?HM4nXXG7fJ4FBQjoMpEQPs1Okb67mwbY4QyL2k+0og2UXepM/cQTlCQ4Gi7l?=
 =?us-ascii?Q?N1LY3qOl1ROf3853C0iriRgi3kjCnDwti0KpWN3QrR6AEC3S7Wpuk1B3PB3U?=
 =?us-ascii?Q?7sq39tPeAFmeYrOvL6mkNgl9nQxWObTrIDaNN1lIRRmPpmjUf1MCQn6wV4++?=
 =?us-ascii?Q?jOYw7UJ1c6yqFTG0A44m+Wjz0cnCab2nbVm2kWKQr81acfILkoPXxFwb0FYP?=
 =?us-ascii?Q?F/VoDuACAIiOVB2a/zBckmskM6tjME5d84ZdJdPuKJfYX95EnhJ5nLETaz73?=
 =?us-ascii?Q?ByKk6wIQUNRxqjhhUjoRieG5L6jFJDklHCc3cNdkgLFaJpSjhEXDuJje5HaO?=
 =?us-ascii?Q?xuYHP3qtQrqOjrMp9QSJoi/HvYENfrUJ2p41u/pMyWxj5YNpVjX/EQK3v8ke?=
 =?us-ascii?Q?2IV7b0DwBLks5fgOGtmZ3Axh9W/HhtPCBL/6abHfZLU9//SBtfqOyLuPpnOX?=
 =?us-ascii?Q?mELz6pgx8m1yPURs7a6hQ811cIRk1ze65DNgVT9MF6NhH4K7Ie8WUWPY0NmP?=
 =?us-ascii?Q?DERRsX9PpikM4tVj9hUzdGl5IhRsL4IHl+hWoT2lGi3yX09vL/oW6d5vFat1?=
 =?us-ascii?Q?jBXhmOKPZdI6RC7G00lwJIa7sdrHVUJwEtjmladptsvuwagW7sOVcI6D1FyA?=
 =?us-ascii?Q?kF8schfoYgC85B0aBVNfvb6Yv4Le2dsukfx9qD1mf+P6JefNo0jlJ+UQhN5n?=
 =?us-ascii?Q?uVN49vWuTew//L14W2QbVBRxkI+q4IC7w1RzEPSarBfmMmU9fXWOs2no8luY?=
 =?us-ascii?Q?j/qQwNeD?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ace6a8-5c32-40d5-83e0-08d8be86275e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2021 03:31:06.7053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uC711sjRNgW/5HWUKVQ/xvM7oR2RLUtQyTpDcc4901VDhVws/oE2nRKA2FwquP80H++qQIoe4a2PCzmY8gbun+ZAR1f1duyEiqrhg1jGQ10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7693
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/21/21 4:13 AM, Lauri Kasanen wrote:=0A=
> +=0A=
> +#define PI_DRAM_REG 0=0A=
> +#define PI_CART_REG 1=0A=
> +#define PI_READ_REG 2=0A=
> +#define PI_WRITE_REG 3=0A=
> +#define PI_STATUS_REG 4=0A=
> +=0A=
> +#define PI_STATUS_DMA_BUSY (1 << 0)=0A=
> +#define PI_STATUS_IO_BUSY (1 << 1)=0A=
> +=0A=
> +#define CART_DOMAIN 0x10000000=0A=
> +#define CART_MAX 0x1FFFFFFF=0A=
=0A=
I'd align macro definitions with tabs :-=0A=
=0A=
#define PI_STATUS_DMA_BUSY      (1 << 0)=0A=
#define PI_STATUS_IO_BUSY       (1 << 1)=0A=
=0A=
#define CART_DOMAIN             0x10000000=0A=
#define CART_MAX                0x1FFFFFFF=0A=
=0A=
