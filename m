Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56F68CEAF9
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 19:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbfJGRvT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 13:51:19 -0400
Received: from mail-eopbgr680095.outbound.protection.outlook.com ([40.107.68.95]:15936
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728031AbfJGRvS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 13:51:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnEntFx3J9i3xy7qN0RVe4eU0Gzi1EeFz9wz0qdc7QMsOfOz8U1qDaWHWRtNfUxNAMxttv0gdM2CdZhCLr0ITcNtXFdFc6q69yDCsoHTT/+xzSRq5T2gRKcMrRJaUhfN9tsnzJ1hd36ZrYLKb9bTQng1MpWMu5Zilj3JundvEi31AdSJhmrDui1XMIXp5DCAmTna53/J61XJaNp57I3wO9zOm8L6F9zg6VwUfEh6BwNpyoglU6yMR64vSW2WFIFm4uhQmzzZLpc4ytyXq6ELuYsH+RZTGUFe9N87nRkrs5VeNf4SxKSgtF/SMRaVzpdGpGXD7ymcfrADbGGI79DR4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWn05O2zeyFnYTltFg1nVid4scH2G2aSf/5uahlyc6A=;
 b=MAWuWsDqdIIK7AGgP5iybhH5+VwdYIeC0h9xb8Mkd8wCOGrdf7YbHKL1UcWRBI1XK/N4loqfDYC2j3cZIohYd9C6wHscTqy/+LCiSqlydZ/fKr6ZodI7HcpQbq3XdA2/jgRkaMpLpox1MaPCUL+b1LD8kh5t4nv3GtB3V9UdqBCmvsHrNfMgOnzlPyF+JwkrD0hl8ltMHsBAuEmTU2LwyI7IWbeNAOF4eIdCEXtZ0bH8Kag0fEcNXnOARx7uhrk2yzK3ZXusHRCMKpO2/sUeNghewMoOj3Gf2FWXj7AtO3kYSoKa7QNz4evzZp071wVINsobSfsePY2BxE+BCvvz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWn05O2zeyFnYTltFg1nVid4scH2G2aSf/5uahlyc6A=;
 b=ms+nFmoUT2bZJwybSgemK3wtVapRTAyUTUyLFqWtTgU87KZqvhV23hQkbScp0w+b3xGivUPrOTGkM7RSjmbXN5shIMKRp/pUdLM7EiVKKYHpKjJCD7hx3L36/Qyvg3gklAMoYl4FOS2O4rA8f/SNSt271GzeQmDaNfOnMj/HcKc=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1232.namprd22.prod.outlook.com (10.174.160.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 17:51:15 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 17:51:15 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Huacai Chen <chenhc@lemote.com>
CC:     Paul Burton <pburton@wavecomp.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH V2 1/3] MIPS: Loongson: Add CFUCFG&CSR support
Thread-Topic: [PATCH V2 1/3] MIPS: Loongson: Add CFUCFG&CSR support
Thread-Index: AQHVfTfQdo2vpvtN0EeAMMNou/4HOA==
Date:   Mon, 7 Oct 2019 17:51:15 +0000
Message-ID: <MWHPR2201MB1277326D98BD1BFE0A5263BDC19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <1569073828-13019-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1569073828-13019-1-git-send-email-chenhc@lemote.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0007.prod.exchangelabs.com (2603:10b6:a02:80::20)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a76fd2d8-1814-4402-214e-08d74b4ef31d
x-ms-traffictypediagnostic: MWHPR2201MB1232:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1232AE8FD4621FEA841CF745C19B0@MWHPR2201MB1232.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(366004)(396003)(376002)(136003)(346002)(189003)(199004)(74316002)(386003)(966005)(71190400001)(44832011)(4326008)(4744005)(33656002)(102836004)(71200400001)(6506007)(5660300002)(256004)(6916009)(14454004)(6246003)(8936002)(55016002)(54906003)(305945005)(6116002)(11346002)(2906002)(446003)(186003)(26005)(3846002)(6306002)(486006)(66066001)(9686003)(476003)(6436002)(66946007)(316002)(229853002)(81166006)(42882007)(478600001)(7696005)(52536014)(25786009)(52116002)(99286004)(8676002)(66556008)(66476007)(64756008)(7736002)(66446008)(81156014)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1232;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kZHVv8WVKmdDe6bOAu+hbH1Jm7TD8IA+WISHkGZSZ+KFM0nTFY6gpUfc3AsMJJma9k781zxAFSB6KNZRY7cxl8Q8l7nZIctseVpOSH+uBgihsKU9I6kQmuirJ5GzYvRGGGVPtxHHHDB7Y3qtNmzVI0emBmfsx6iCsYmXQolL5uIX5htEsbLh9dVbOB+k7bXMQyRnDJg8ZyScg+KQwZttXKrZRJ6M/FyRkZ2ibGG+0xAB1teZNAP4paq51EUX5E9qsy/09CAWaz2FZ7qnM+tuqaS8Xk5CRHkiFjyuqmlrKA0HKIu75ZkpgfDriUdmdi9I50hcHPRGt6jtEMpJymkB4IxAOWGbX6B4nBZZfz0WVU6hUmK+sKzxMt4TjoP2qbsySmEJTjZ5XW384pKsi8vq5vEKo8Nh0xZodC+3Pc9G0CKMHWFgstwFXSlDjC68koVQsEmRp6q8fCwYkXfvnP5AcA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76fd2d8-1814-4402-214e-08d74b4ef31d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 17:51:15.8197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BymZAx7rbV7ZM98GZdwHACQ2Ab1cmrGCSaL8GxuBcy7GtmFLQMN/ySqaVNfDHlCxnC9dUBdPu/EGCjj6OlCTXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1232
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Huacai Chen wrote:
> Loongson-3A R4+ (Loongson-3A4000 and newer) has CPUCFG (CPU config) and
> CSR (Control and Status Register) extensions. This patch add read/write
> functionalities for them.

Series applied to mips-next.

> MIPS: Loongson: Add CFUCFG&CSR support
>   commit 6a6f9b7dafd5
>   https://git.kernel.org/mips/c/6a6f9b7dafd5
>  =20
>   Signed-off-by: Huacai Chen <chenhc@lemote.com>
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: Loongson: Add Loongson-3A R4 basic support
>   commit 7507445b1993
>   https://git.kernel.org/mips/c/7507445b1993
>  =20
>   Signed-off-by: Huacai Chen <chenhc@lemote.com>
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: Loongson-3: Add CSR IPI support
>   commit ffe59ee36aaa
>   https://git.kernel.org/mips/c/ffe59ee36aaa
>  =20
>   Signed-off-by: Huacai Chen <chenhc@lemote.com>
>   Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
