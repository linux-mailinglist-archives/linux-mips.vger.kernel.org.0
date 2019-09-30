Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEF7CC2A48
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732018AbfI3XIW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:22 -0400
Received: from mail-eopbgr710105.outbound.protection.outlook.com ([40.107.71.105]:33459
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732246AbfI3XIV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJQHidDChIUG5gBiaChfpjcOlaYKcVdJD30ebkbA5CZvr2nKUvsCN3bvADYIQLd0HkSBJCdMjm5nuFgmrmT3nbpk2x59tljRODazfT8JmTypfO/OT12MOdAXki7RLhPrKfHVmD8B7JIZUiL1JL2jT8bHtjb7L2AAJ+6yo98Ga7CeZGYEK4+kROgKF0s2DdqJEv5q9r4F4L9CjbjGTd9z6xaapNKWwPLPR9PbKE2HXKFy8N1CJHo3uIx2JaGdDBb6kV1DzR8CNzv+61I6ne8XXl5VzjvtdmYA/hQiDIbvvMQKj53yDbtfOYluttPZPVsMXnEBqE8JuZP5hpl8hVWvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlgXrBWp7RH//htYCKYl6gXUEMhb1+7hgVOI3Od5iVs=;
 b=oXSs2FHtsa1Zu/5TNp3+CBFpItPfBtpRq41xmvFM3iYWiF5T2cucvxgNAhYvRCeD7oF+6+TBIeUZNQMpEFsUpkbgKzPCK2GYBMj3+OQcGdGFQDEksESq0ZOoirlOCI9QdUndK66Vea21goTVcyKeI+kVvySb4d+S1f4YeVHh9jp8opCvc3Lr4z/MfXOIQqjk03JGTtmJtQvFPGXiQ4f6Ju9DXbd99Hx5lo9D/iqMAnYs/W9AWWdZN7EwuOpEICqFNKb8ssMx//O6msBAy1WIV8r0gdN9poE6RfTgz+53T6NJi1EbcgLV+KWBa7qJ5GY4h7hCZ01R+G+9/tU86vMQkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlgXrBWp7RH//htYCKYl6gXUEMhb1+7hgVOI3Od5iVs=;
 b=u2ykeHkt4pQrkFOouKwyWB4gkiZVQui4U4WqziPfGqYYa3Hda/SxrPJtZkVYBHkAX/LKYusfjTb7vzRY1ImCTwlkMhhbdwkjwVksIKaVFEWQLDPPmSm8hzD0lzKBr9tTnw2GseQMt8oadpuwfnvkZLvlHDzddjxsVIB3yP0j2pk=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1709.namprd22.prod.outlook.com (10.164.206.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 23:08:18 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:18 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 05/37] MIPS: barrier: Clean up __smp_mb() definition
Thread-Topic: [PATCH 05/37] MIPS: barrier: Clean up __smp_mb() definition
Thread-Index: AQHVd+PyjeAR6CxZcka5NocqscHcuA==
Date:   Mon, 30 Sep 2019 23:08:18 +0000
Message-ID: <20190930230806.2940505-6-paul.burton@mips.com>
References: <20190930230806.2940505-1-paul.burton@mips.com>
In-Reply-To: <20190930230806.2940505-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b6e6f17-c0dc-41a9-420d-08d745fb14db
x-ms-traffictypediagnostic: MWHPR2201MB1709:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB17096E8AAA4F519BB7E604C9C1820@MWHPR2201MB1709.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39840400004)(376002)(346002)(396003)(136003)(199004)(189003)(2351001)(66476007)(66556008)(66946007)(64756008)(66446008)(107886003)(99286004)(6486002)(52116002)(5640700003)(6436002)(25786009)(478600001)(14454004)(76176011)(26005)(6512007)(5660300002)(71200400001)(71190400001)(1076003)(4326008)(186003)(42882007)(6506007)(11346002)(256004)(486006)(44832011)(476003)(2616005)(14444005)(446003)(54906003)(316002)(7736002)(305945005)(6116002)(2906002)(3846002)(81156014)(81166006)(102836004)(50226002)(6916009)(386003)(36756003)(8676002)(8936002)(66066001)(2501003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1709;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SAj3usvMsSOu87ekDeX6Sdq0ZbGhmhZvJ6LNtH6XOZ58vbkRVJq6FVp7KBl6DOUEuy69fnzJQno7SCaAhIFk+nNIZmhdw0rMol1DvbqryI+pKa/dWOhqS5bUTGgzKX2dUTCx8RFI/8XZ/rsBexaeAsEyVWA/TohNKAH79SSo5dzpSZ1V6/5cVi9AHD/VWHUMl2YpZT2opLviPDuuOAKcmiBYTsDChtlxUGu+Vw32mRaXGf1bjg2fgoAK3iGbrIeKjpelFI51F9raSwpbGQiaji6QiD6KAfxsf4lTU4WJnKQq4xc3w0HkbjeC/Z9KWjW68vm1qkjwp13Rorq6Wn8z8MYMJDtIQXPraFBfcffufgRYh9N/FoS8efaUxiiRcWM1lpHlL3gtci8t07W757i5sWbzMllz65pI59X21ytTp+w=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6e6f17-c0dc-41a9-420d-08d745fb14db
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:18.6925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L7FwRa+qfrSFtMVAx7TKH24Sx0D1FrkWZs8Es6HO+GieoEUd82EN63kCiqnvuhsaZBZuIb4+R958ERlfw+pYmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1709
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We #ifdef on Cavium Octeon CPUs, but emit the same sync instruction in
both cases. Remove the #ifdef & simply expand to the __sync() macro.

Whilst here indent the strong ordering case definitions to match the
indentation of the weak ordering ones, helping readability.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/barrier.h | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index f36cab87cfde..8a5abc1c85a6 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -89,17 +89,13 @@ static inline void wmb(void)
 #endif /* !CONFIG_CPU_HAS_WB */
=20
 #if defined(CONFIG_WEAK_ORDERING)
-# ifdef CONFIG_CPU_CAVIUM_OCTEON
-#  define __smp_mb()	__sync()
-# else
-#  define __smp_mb()	__asm__ __volatile__("sync" : : :"memory")
-# endif
+# define __smp_mb()	__sync()
 # define __smp_rmb()	rmb()
 # define __smp_wmb()	wmb()
 #else
-#define __smp_mb()	barrier()
-#define __smp_rmb()	barrier()
-#define __smp_wmb()	barrier()
+# define __smp_mb()	barrier()
+# define __smp_rmb()	barrier()
+# define __smp_wmb()	barrier()
 #endif
=20
 /*
--=20
2.23.0

