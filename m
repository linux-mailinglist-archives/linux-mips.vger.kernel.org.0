Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 241F9C902C
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 19:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbfJBRrK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 13:47:10 -0400
Received: from mail-eopbgr720138.outbound.protection.outlook.com ([40.107.72.138]:35519
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728412AbfJBRrK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 13:47:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ll+qXvac6DcutucENLeAIaupRC5y/JxU7XkoDo6E8Z6f3jjJn1LJbXKEs+h7yCd0tydMbiNIe+fiHkySipHAeF3ZDeVlQj6JfrYLgQcSGAdE/HfFKPMdJyYcoh3xLawGIs48w4tNkwjNpiS/BD9GZyPXS1E1C6hGxHnBLzJg9n4cHLovKLe5xTdhsjuIJIWQ0+VscdVKRFllYHKUPoxUzuXeF1RdXdxItPhppGTMrPw+6nVDZkXKM3etIXvhSM5tE/CePfWcZDPlkjFgu05mS6/2vwOeQUybjnmOEzdzWRXQamzwO9uEX75Mj/LtivmV7zHnjI8uPQTBzlo/sAe19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXH/eNAwtvvHwaW80VvF/8bVvtjFVbQSqAW4mkjtAwA=;
 b=KiFms3EDqwZPjikrbwsivu6mTXtlQU5sqvGgeBA4JJCJFJJuTX6LNjNdLMQuptlSca0fmb5FhmMw9cIVB8L8vjuqTdzWmSzOyuU/GnjnmrgoEszC7fhYiFOx/Nx+JiGZ7NbqQkm9OZYw7lDvLRuNHuXyfMeh8Y/QZTHDFhJ/SwjvF35IAsU7DQD12Jh36gfvZAodEud0Iwub4PjhrWuQqEwJ1DZl4ekd+deUXx2YYpXy/44NJuqhk/X71fn5tpbBc0K4TSrCQCx8kxwxTzV2HxfsXKvOuFPtW3wQHdUT4eANzbG+Wvx0OXheQdyNBbNccrtmAHnFx51yo1OOyvea7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXH/eNAwtvvHwaW80VvF/8bVvtjFVbQSqAW4mkjtAwA=;
 b=DGBHW6myIHjUTqwgcqFUJoL8eYpmrc5Mo8RnBCGFlQoaM3MUsSJwBZgYew5hrd5uJgNTYc9iZlOaOW32dWGl8HD5ogzf96dJ7ybp1gjbSrXOXYWNN0yDprz24amg90OkqPQ0PRzaMQdPoTv5TN96SNeCpyWe7/NykbwQX0FeEJs=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1646.namprd22.prod.outlook.com (10.174.167.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 17:46:36 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 17:46:36 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH 2/2] MIPS: VDSO: Fix build for binutils < 2.25
Thread-Topic: [PATCH 2/2] MIPS: VDSO: Fix build for binutils < 2.25
Thread-Index: AQHVeUlWDfP89pcbwEGYZtTvpI6IMw==
Date:   Wed, 2 Oct 2019 17:46:36 +0000
Message-ID: <20191002174438.127127-2-paul.burton@mips.com>
References: <20191002174438.127127-1-paul.burton@mips.com>
In-Reply-To: <20191002174438.127127-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0076.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::17) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bad8cf1-e9ce-4238-b32c-08d7476077d5
x-ms-traffictypediagnostic: MWHPR2201MB1646:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1646BE78B31BD1D3F5E986B0C19C0@MWHPR2201MB1646.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(39830400003)(376002)(136003)(396003)(189003)(199004)(66476007)(8936002)(6116002)(6916009)(6436002)(5640700003)(3846002)(14454004)(6486002)(478600001)(1076003)(486006)(2351001)(5660300002)(81156014)(8676002)(50226002)(81166006)(66556008)(64756008)(66446008)(66946007)(316002)(36756003)(54906003)(25786009)(76176011)(44832011)(6512007)(7736002)(102836004)(6506007)(52116002)(26005)(11346002)(446003)(42882007)(66066001)(476003)(2616005)(386003)(99286004)(2501003)(305945005)(71190400001)(71200400001)(186003)(2906002)(14444005)(4326008)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1646;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nrxFyTu0ioddbt0iNGW7iP+5tnGM14paMKC5dvqmHeXjNJujFBOtmPEIu4g+GFBnDEJyvCH91S8eXtMzIR1/LDgd1BoXJWfMGf/iZpGYREvD/7LsTEuCoF+2q6tpGMsKjwYrmbG7dxIepvWcJxQcjAolmb/mhM3taZUCz1uZzTGpQhqa6Uee4hLKUyJkARn5IYcCAUigI7hwk5VuxO0/oQjNL+gvrJkUPDunMir7J9l8qe+GLK6lFTFGW8zOz8xJTvVJM87s7qnvU2Iss2zfEEa2L6W9sNQyfZ6m6goquK0qCFEgs7AtZKPbuZf0wJFSEKDJeqRZf7aLbDKX/1i/26eR5h2YgI3qPv4AunFK7kg19K0KjuTMgouEfp6DUMKFLAcsgDNTOYxZ//T7ZwzJGnufnPZT5sr3fsZEzyaZqpA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bad8cf1-e9ce-4238-b32c-08d7476077d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 17:46:36.4033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cK27cldi85MPivu22WAsxubh5Mn/18OIx9c2TI5HQFEGAqMSp23BHD4i01+B4ql23oN3GuB4yFWxSq3jsd37Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1646
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Versions of binutils prior to 2.25 are unable to link our VDSO due to an
unsupported R_MIPS_PC32 relocation generated by the ".word _start - ."
line of the inline asm in get_vdso_base(). As such, the intent is that
when building with binutils older than 2.25 we don't build code for
gettimeofday() & friends in the VDSO that rely upon get_vdso_base().

Commit 24640f233b46 ("mips: Add support for generic vDSO") converted us
to using generic VDSO infrastructure, and as part of that the
gettimeofday() functionality moved to a new vgettimeofday.c file. The
check for binutils < 2.25 wasn't updated to handle this new filename,
and so it continues trying to remove the old unused filename from the
build. The end result is that we try to include the gettimeofday() code
in builds that will fail to link.

Fix this by updating the binutils < 2.25 case to remove vgettimeofday.c
from obj-vdso-y, rather than gettimeofday.c.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: 24640f233b46 ("mips: Add support for generic vDSO")
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
---

 arch/mips/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 69cfa0a5339e..807f0f782f75 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -59,7 +59,7 @@ CFLAGS_REMOVE_vgettimeofday.o =3D -pg
 ifndef CONFIG_CPU_MIPSR6
   ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
     $(warning MIPS VDSO requires binutils >=3D 2.25)
-    obj-vdso-y :=3D $(filter-out gettimeofday.o, $(obj-vdso-y))
+    obj-vdso-y :=3D $(filter-out vgettimeofday.o, $(obj-vdso-y))
     ccflags-vdso +=3D -DDISABLE_MIPS_VDSO
   endif
 endif
--=20
2.23.0

