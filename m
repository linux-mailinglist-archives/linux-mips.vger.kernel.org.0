Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C139A4514
	for <lists+linux-mips@lfdr.de>; Sat, 31 Aug 2019 17:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfHaPme (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Aug 2019 11:42:34 -0400
Received: from mail-eopbgr780138.outbound.protection.outlook.com ([40.107.78.138]:50560
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728144AbfHaPme (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 31 Aug 2019 11:42:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yor+pdQ1geASZ7i79bqGNhhiHOFPvpv9+DGuYpwxspDh1bIaZWdv+KyfkW/7aGfBYrjW4/GS3NFhLaU3tQh6OHKq7U7prE5ZS04bz9E95WjTHX9U1RghHyKxZUVzs05eaz+8XT9EyHv4GfM8wuSjb6FFkhtvt6VE3EGEv/XPVn0yDIvcFw7yYK6F8vEFzCgTfne8DH0ya2JEQg7lj33rNSDhQcHw7Pzz1MKLFFiAuPQFtW2ssBxA33kIb8HitiW330DPmOmAvjWVQ7GdUseWy6vt1TchCHI/zSXUEfImZts5/NkFvWe7eF7ut7Mw9Nt80dZZVxH0z993W6g/qAJBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJrgKjmGd2KheFeCg+ePXAPYf0dwryElF866+zZI/es=;
 b=kLXB7Osd+cS9P13HhE5wGr0PQqq2CslFHaQ9AnykUGpAMt2JnNle0oK5CTIM1n4wWkJWGpYq0tbvgEvbsHHMh+b/XfZCFM2AF54X24TnPNv9bnjzKzRFM1IWeS7cUuWhRVV3hY4U6c4IIpgcTRMxDMvbNu5SeMxqgbU9oBptEEKj/WLy6EnFYGLMkEC5VftrP5q5gwNvocA7i6TZQ4et17ar3tSQCUjCJDdLdrmK9ull41iCS+sQVKa+4DHOHK/AQvqi0nCscDEThk48yRt5Glxd5teDeNKkYeQoTORDvtVmheFJuhfijuhU/kvvXokhvbejmfZ2jegMssRMM34DHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJrgKjmGd2KheFeCg+ePXAPYf0dwryElF866+zZI/es=;
 b=A5taNhdRYoyehzs2npVnePAqwkRN/Oc00BTQMdL7cyaP2WhaSP9kKd4EL5Q3rs6VNLqE3cSxZiOmB2izawWmAmSfMKzXlJdDj2m8D5wd/gfpeEA5Z3FwHJACcFwSTleXzdYwFmCr0/0oGMHnj6XyE3FAwvMx8vsAYoY+5JFcvJw=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1311.namprd22.prod.outlook.com (10.172.62.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Sat, 31 Aug 2019 15:41:59 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2220.013; Sat, 31 Aug
 2019 15:41:59 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>, Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] MIPS: Drop Loongson _CACHE_* definitions
Thread-Topic: [PATCH] MIPS: Drop Loongson _CACHE_* definitions
Thread-Index: AQHVYBKgBRpwpRy2vUOxDgPtlxAwFQ==
Date:   Sat, 31 Aug 2019 15:41:59 +0000
Message-ID: <20190831154145.7328-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0267.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::15) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.1
x-originating-ip: [78.144.179.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9786fee-dc71-4517-78f6-08d72e29c280
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1311;
x-ms-traffictypediagnostic: MWHPR2201MB1311:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB131131737F452C709C22AA1FC1BC0@MWHPR2201MB1311.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 014617085B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(376002)(136003)(366004)(346002)(199004)(189003)(2501003)(14454004)(386003)(102836004)(42882007)(6506007)(186003)(52116002)(476003)(2616005)(486006)(44832011)(26005)(2351001)(6916009)(1076003)(478600001)(14444005)(5660300002)(71190400001)(66446008)(64756008)(66556008)(71200400001)(66476007)(2906002)(66946007)(8936002)(81156014)(6116002)(66066001)(5640700003)(8676002)(6486002)(50226002)(316002)(54906003)(6512007)(256004)(6436002)(53936002)(99286004)(25786009)(305945005)(36756003)(7736002)(4326008)(81166006)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1311;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GgAcsCruhsJjAhif7g/vsxfwjMte8TKDGu6rKlY/m8439/8nX7DQVfL3YBXMBhKZkcXok/QYGpU35jA2DEmblRJ7UwfNIWwLUvBWDKQ/g4LljfGTtEPJB2tCrejgq4RrIGG22b/cN4Po9snwEzWSIaA9wZ6A/nc06HwzxkcP8PlWYJ/fZP19PwG0es7BQB2i4bbKCXKf8fe0Yy7TRXSmpdrkg9coa1b3hIWfHNxGP0FOl2oIgQ0WinLttlTqT06sxjetwqmL8TPU8WBMWjUUgo0TmCH1UBrimE8M+Tv5PavTr1b16dSKtfySESI/h7ki4yXsTuURxN9Xg+ZFZ3QqDyVxM5aHIdzgaBMJDJQOHCMYGUZW9aPYDlxdOhOzMt9K3xT0VTE7zIUlEQ7xMwsYPgzkDuoQVaZY5I9SjvCeBtk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9786fee-dc71-4517-78f6-08d72e29c280
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2019 15:41:59.0999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IflHQJCOTXEGv58XYz/KZ4oaXolwA5vCE1CwicPTdaNOKTMuVJkFITm43q5M5EVXS/ynKvd7Q7PPrWItZtVF9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1311
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

_CACHE_CACHABLE_NONCOHERENT is defined as 3<<_CACHE_SHIFT by default, so
there's no need to define it as such specifically for Loongson.

_CACHE_CACHABLE_COHERENT is not used anywhere in the kernel, so there's
no need to define it at all.

Finally the comment found alongside these definitions seems incorrect -
it suggests that we're defining _CACHE_CACHABLE_NONCOHERENT such that it
actually provides coherence, but the opposite seems to be true & instead
the unused _CACHE_CACHABLE_COHERENT is defined as the typically
incoherent value.

Delete the whole thing, which will have no effect on the compiled code
anyway.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: Huacai Chen <chenhc@lemote.com>
---

 arch/mips/include/asm/pgtable-bits.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/p=
gtable-bits.h
index 5f1ced8cba07..409ae01ed7be 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -221,13 +221,6 @@ static inline uint64_t pte_to_entrylo(unsigned long pt=
e_val)
=20
 #define _CACHE_CACHABLE_NONCOHERENT (5<<_CACHE_SHIFT)
=20
-#elif defined(CONFIG_CPU_LOONGSON3)
-
-/* Using COHERENT flag for NONCOHERENT doesn't hurt. */
-
-#define _CACHE_CACHABLE_NONCOHERENT (3<<_CACHE_SHIFT)  /* LOONGSON       *=
/
-#define _CACHE_CACHABLE_COHERENT    (3<<_CACHE_SHIFT)  /* LOONGSON-3     *=
/
-
 #elif defined(CONFIG_MACH_INGENIC)
=20
 /* Ingenic uses the WA bit to achieve write-combine memory writes */
--=20
2.22.1

