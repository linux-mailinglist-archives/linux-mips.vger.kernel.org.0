Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F241CC296C
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 00:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731340AbfI3WXD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 18:23:03 -0400
Received: from mail-eopbgr770133.outbound.protection.outlook.com ([40.107.77.133]:5562
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726590AbfI3WXD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 18:23:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyCTE0LiwFSmdi70a+k1sPOvqy+omslnO+jrXGr2hsS5JsgyZKtXHqXoNPF7L9UcXTZIJGmGYTnyJgYLzFdrSoDtYVRdBmesjOhe71pjMsTEw5La//pleaE7HKxuTl801kgiKnvPwBWM8PsyYh6QpKmlcuE9u06S/h6jJTJLYPIAEauwFq4t9W2bT0TdbZWSOpkPlnLjDcfXk8zC0ZzEaG7RcjH8vZ0l8J73/HqcRCreMz0kxBHLc/E/2s/czARlFQRxaHmFLWUO+vWb0qwtvhwS/48ma7Gj5YjxJT0+WEd13HtkWuPNAd5Q9JkHVu59VoB+RF/XQ8MevzO6G4XKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2Xd22pd0bfQ3dJl+tl+9f1KWlEpRmmgKec2u3P8hHE=;
 b=U5VYUYsCrKlkSDh17s2jc6S5uWBxGKQolrTjap6sG1J11ZbKwvoDn/nzsWi69Lf1FrRnNahpjQqBUsFpmwVLpbc2/ku/y1BvPSpbTBjDzt91ZIALuHXCR3uo1tLDfCF/gCmWd7s2KmXWQzpmDcMvekYYBmjxzLPgAt4PZhIngJnmeaB6d6oGk9lqb7mDGA8cgkDpwcCLuApiReFH9O6QbppLMMk6w/K7oeFQZqm3oydjMqqxzsVGWY/bAf/GvRaQ1ddu13INt7f7zFzlpPfngJ/OsTr29+yfdXanoOYDXGtPBlAdWfZ75HmFDxeEZ53DzTbAuUFUimnkfvjkd6cO9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2Xd22pd0bfQ3dJl+tl+9f1KWlEpRmmgKec2u3P8hHE=;
 b=eH2o9O5kHigDOm8JhoYIDthyfDSrCgkB8EGaQw1Y/QyVJ/E1W78+qhuHQ7rAsXzS1ZQ7xt0dcrJufdCFSSdOs7I5EWqBkfIPzm9iEtKw4fKBpZA936ESPK9mH811HKKYxL9cvBmV2p/Qr6Z7zNS4xEed8LZKRdu0zWVroUWPqAg=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1168.namprd22.prod.outlook.com (10.174.168.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 22:23:00 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 22:23:00 +0000
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
Subject: Re: [PATCH] MIPS: Loongson64: Fix boot failure after dropping
  boot_mem_map
Thread-Topic: [PATCH] MIPS: Loongson64: Fix boot failure after dropping
  boot_mem_map
Thread-Index: AQHVd92e3VljCIM2GEGIMJQjKo8D1A==
Date:   Mon, 30 Sep 2019 22:23:00 +0000
Message-ID: <MWHPR2201MB1277A363387DA6F09163096DC1820@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <1569580062-5296-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1569580062-5296-1-git-send-email-chenhc@lemote.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0057.namprd02.prod.outlook.com
 (2603:10b6:a03:54::34) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e543fbf-d897-43ed-9ca0-08d745f4c075
x-ms-traffictypediagnostic: MWHPR2201MB1168:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1168F430610529CBAD64AA17C1820@MWHPR2201MB1168.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39850400004)(136003)(366004)(199004)(189003)(256004)(7736002)(76176011)(74316002)(305945005)(6506007)(386003)(52116002)(42882007)(26005)(55016002)(186003)(6306002)(14444005)(9686003)(4744005)(102836004)(7696005)(54906003)(99286004)(316002)(44832011)(476003)(6436002)(446003)(486006)(11346002)(5660300002)(6916009)(229853002)(3846002)(6116002)(478600001)(25786009)(71190400001)(52536014)(71200400001)(33656002)(2906002)(66946007)(66446008)(66066001)(64756008)(66556008)(66476007)(6246003)(81156014)(81166006)(966005)(14454004)(4326008)(8676002)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1168;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nJvJyHow9AmJtp1fbtQS7EGL/GUXMjv9U81KqmBVfosEnVF0bnYgSC6zgpdHKcNeJNx+XxOHjMwp9PMw82UPHog26E0fcGShxpjKW4p4HN8mA+2OzJ5uRiqfzU4e4/7opdl9qdg3PB6ZCF5hvTOA0q8ELvs1tKsjOjqC4LtjbRK+eNBxhtE8O5xOJwmJda7hPwjrCL0SBK7NpE379Q4o+qWhS2yLuII+K+JR3Sq0o7M0rQurxLF6BRgfpasL3ZzpTqHn+EytoqXHzbd1oHSV/GqTlmJyoWmEKFgYLEtyuT3A2Fq3N2j5oyZAXDvVL4llLygjTKoLcqL5Xx7OMTtK/oHffIcam/K8SFxZD0MWypo1/tV89iT3vrYi7Dqexq+9+LgxcLUD2Opow9Ut7GjgB9Ro39yUORX7pOeXVgCo6LwE6luR0+bO4Nk5wlx+y7sOUjVfnR7f46SmUOWGl8dBLg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e543fbf-d897-43ed-9ca0-08d745f4c075
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 22:23:00.1833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sxp681uIrzi7Rf4tNmSk8wv33eC2ZAQhsZsz59+ooJkwYX9s32qugiRCC/T6gmm9nkcZlxmZsC4EB5i9nA1lzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1168
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Huacai Chen wrote:
> From a94e4f24ec836c8984f839594 ("MIPS: init: Drop boot_mem_map"),
> add_memory_region() is handled by memblock_add()/memblock_reserve()
> directly and all bootmem API should be converted to memblock API.
> Otherwise it will lead to boot failure, especially in the NUMA case
> because add_memory_region lose the node_id information.

Applied to mips-fixes.

> commit 2b6509f42dc6
> https://git.kernel.org/mips/c/2b6509f42dc6
>=20
> Fixes: a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map")
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> [paul.burton@mips.com:
>   - Invert node_id check to de-indent the switch statement & avoid lines
>     over 80 characters.
>   - Fixup commit reference in commit message.]
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
