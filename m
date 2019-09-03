Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04233A7542
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2019 22:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbfICUru (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Sep 2019 16:47:50 -0400
Received: from mail-eopbgr740130.outbound.protection.outlook.com ([40.107.74.130]:54944
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726375AbfICUrq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Sep 2019 16:47:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ug1bjRejfjh/uHsY5p4KIEBwknRjZSH06ERwAXfGL8LMp1eOKvjukAF71s5ZU+GLxu35FFVGtr++kkvyKl9ynSIr1XQ3LAr6iWDuU57ORAiy06X72F0odc+DBCqfWeXEgiLffoU3yvf/DSQ0/1mo2nHZPHuJ3CBkMJwgQq2SpT8WxMCE0noPJlJwCh9NHOQV3lzMgcyLSWrMVJSQgLky3/jcwz19iVOG0F703lndvqv9Wp+VdxAVRXWW8kV+AEjkT4QQb9LDdyL4pALQQKiwFl3UCwpIkktqWp+EmdNmWTTkhp3C6Q4Qc4pJvxcWeZpNBoRqNWd3SDt+7hL3JisJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUgPSQv+r5StWQ6bfMtlK7naR1omTHvHOnuKrq3A+EU=;
 b=cFkqpVni1UCIA5tPKeAevNXyup4Tvuo6aQDBFR6M39m5o4EZkYJAm2nKB22NJo8Tg9KpPJJbM2rv9ze2K9HcUq0dvn2UH9RRV/OP1XcTUQMqlnAuYhzEoTyBq4uclhXSG2n8hwfRu501OYhcZk02RrTEejAhxa2ow8km7vNaKoup9tINJqh6AKIVYKf6XkWZwypCs1/s2M2WOMAkcFxRMBxJpTXDWDkueymcZpbiBC0cvSTGyIe4ohQmBJX4vMpWgIDnVbZJaZjEdARthS9Wx1dxENmvUBtN4qzNwsFQZU1hdB01KEnbLyqAfrp6MYRFGj8EBvZ0D7KxDZjgYgG+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUgPSQv+r5StWQ6bfMtlK7naR1omTHvHOnuKrq3A+EU=;
 b=NIvyd3Bv6AP6TvKpoxUO7zDbind6kM5yGHtDmS0rnznIFs7SPtRj20LZavv9o8EqHJOU+YbLF/VKLMoY2TZIHZXZGWOYAnJy5+L/YA5xgbui2Pn5kNs86R9i0M5wQVbNrONfYf9czpO+60b+cT0ikwSDhioJUESOHPvanHIWCjo=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1343.namprd22.prod.outlook.com (10.172.62.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 20:47:42 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2220.021; Tue, 3 Sep 2019
 20:47:42 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Huacai Chen <chenhc@lemote.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Drop Loongson _CACHE_* definitions
Thread-Topic: [PATCH] MIPS: Drop Loongson _CACHE_* definitions
Thread-Index: AQHVYBKgBRpwpRy2vUOxDgPtlxAwFacaD++A
Date:   Tue, 3 Sep 2019 20:47:42 +0000
Message-ID: <MWHPR2201MB127745CFB0EE46FEE15D1ECCC1B90@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190831154145.7328-1-paul.burton@mips.com>
In-Reply-To: <20190831154145.7328-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::21) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.196.167.206]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a90c6f4-42b0-483e-08eb-08d730aff70e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1343;
x-ms-traffictypediagnostic: MWHPR2201MB1343:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB13432EFC050A02D4A7B9C683C1B90@MWHPR2201MB1343.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39840400004)(396003)(376002)(346002)(366004)(189003)(199004)(42882007)(26005)(6246003)(81166006)(8936002)(966005)(74316002)(6436002)(66066001)(2906002)(81156014)(8676002)(305945005)(478600001)(486006)(55016002)(446003)(9686003)(53936002)(6306002)(54906003)(3846002)(44832011)(6116002)(6862004)(4326008)(476003)(6506007)(386003)(102836004)(7736002)(55236004)(76176011)(14454004)(186003)(7696005)(229853002)(11346002)(4744005)(64756008)(66446008)(256004)(66556008)(66946007)(66476007)(5660300002)(52536014)(25786009)(33656002)(316002)(71190400001)(52116002)(99286004)(14444005)(71200400001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1343;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vzpBcK371CDvWap6R4KsUKewruxKadEMHR/rvic+Oddmm9ONDPrRAMw1olR4f3pZDPyCltVXngcy7uo21K1OO+EnfIy9J7GWrh/QPdMCgKyAZajX3psjIT2x1o3527Povqlbt2ZoYrB/9huWbAeN9CNVx4qbwJ+clCaE7SsfIg0KPboO3mAMloO1If/Ql+r1RlUvpykE7Z38roO/Awr3u0NGU+eAuaFgHjNS2xSC1Kzkjf7KpflDFRnGaMeql3hVuXGnNycw4ZtiIg2FL5oWydOiWCefyFLuvl0TBQW2MpOc5rLBVS+mz3V8fgePoUj0kVKV7vbq250uorERh8CyxrH+aR7AHVQh+SDahsdnjcBSq0S1HgTfFofqYSBumom100LzqI28Yym7rHb/qJlC76Cy8GQQrv8XSUiS5VLef1Q=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a90c6f4-42b0-483e-08eb-08d730aff70e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 20:47:42.4873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0UY6Orn4hz6jMO/uRnbUB3uZNNWJ/92tDIILYI7SCd34a6cK2b4pjl9ySVcX84/bxofU+nRrVHuDTfRGHoxh1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1343
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> _CACHE_CACHABLE_NONCOHERENT is defined as 3<<_CACHE_SHIFT by default, so
> there's no need to define it as such specifically for Loongson.
>=20
> _CACHE_CACHABLE_COHERENT is not used anywhere in the kernel, so there's
> no need to define it at all.
>=20
> Finally the comment found alongside these definitions seems incorrect -
> it suggests that we're defining _CACHE_CACHABLE_NONCOHERENT such that it
> actually provides coherence, but the opposite seems to be true & instead
> the unused _CACHE_CACHABLE_COHERENT is defined as the typically
> incoherent value.
>=20
> Delete the whole thing, which will have no effect on the compiled code
> anyway.

Applied to mips-next.

> commit 3d77a95fc03b
> https://git.kernel.org/mips/c/3d77a95fc03b
>=20
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
