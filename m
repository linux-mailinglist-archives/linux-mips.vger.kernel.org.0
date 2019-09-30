Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5C12C2A9E
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731890AbfI3XKn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:10:43 -0400
Received: from mail-eopbgr710105.outbound.protection.outlook.com ([40.107.71.105]:33459
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726789AbfI3XIS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEVR7se2Z3BRLw1jCX+mvLcGES+HhrGHl0NIncYhQooKk8kLVKnO013hlnaRXs93Uc00Oy1oX9/j0ngy9dcpkeXOdJq10oCxc5aJga+LcwxtVFidXJiHtdEYvVUqXuLBQDLgSsDIpoTa1fbQEiDb4LawOVWM8Vl3toVSFqsir/PAQNKa8ha/ceh2EPI51dSPlJM1cajQD6ENmOnmKbKvQhB2cv0Z358JaTbeuuUDHkTFKs4V7sRJ6z3OkmPYD8rBA5iKDrlW2QibQCZzfotDGtbZtqrvRq5FcEYSh+R6FselZM0cPp867HXqLSejiuqKmklEL4IpN9i/Dp97+8R0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bb5CGjJcO9JsblExHKeC5e8gn1nT23BsfTVgf0jISbo=;
 b=GYsqGZzjuY/sCCnvDNDdibjUdtPNA3u3YUCVody05F6Ac5A0ZbDbL4MgcpLI2SZp/u5Om2QtR+h6+Gkhb5axv+GhBCrmgItqTbbl72Hpw+uOuhQxOvDEKk45hYD1IN9L1CsxX5pJa+h35zpXq3Rln4v/xnvN8Pg7H7cIfdU5o6BaiL7wTx0wA/q6zkP7tY0h3yWjuqy8/EGdfvEPUsj7hURpV48eQ5xSJmHnexaJTURUS1fDMQVIrprZxMe9Q89N593WUxzYzZmleg13zOa1rK56gMigT/53wRmR980gvF5FbsaIcM/41BTm/I26LFtShmzy4vmyNVNwwA2rdm7qNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bb5CGjJcO9JsblExHKeC5e8gn1nT23BsfTVgf0jISbo=;
 b=T1CYJW//FrS3VdN0ArJeQEePtG2l3Hpz2wOoASaUwgYgcZdYB8JSEWeA3mpW2HAs35c97gSt1/kvxylrb8mNH9SfLKTIxcLi90uceEH8BFYGny/UQSCUdX8hLpsQLfIJl03vGbzoKlatWXUQtrohTBJWNk+nK6Exh3EGDEUHx04=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1709.namprd22.prod.outlook.com (10.164.206.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 23:08:16 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:16 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 02/37] MIPS: Use compact branch for LL/SC loops on MIPSr6+
Thread-Topic: [PATCH 02/37] MIPS: Use compact branch for LL/SC loops on
 MIPSr6+
Thread-Index: AQHVd+PwLwYhLPuiu0W9q5wn/sVxdw==
Date:   Mon, 30 Sep 2019 23:08:16 +0000
Message-ID: <20190930230806.2940505-3-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: b1826e22-3325-4626-d08f-08d745fb1342
x-ms-traffictypediagnostic: MWHPR2201MB1709:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1709C6554E2470A028EC46F6C1820@MWHPR2201MB1709.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39840400004)(376002)(346002)(396003)(136003)(199004)(189003)(2351001)(66476007)(66556008)(66946007)(64756008)(66446008)(107886003)(99286004)(6486002)(52116002)(5640700003)(6436002)(25786009)(478600001)(14454004)(76176011)(26005)(6512007)(5660300002)(71200400001)(71190400001)(4744005)(1076003)(4326008)(186003)(42882007)(6506007)(11346002)(256004)(486006)(44832011)(476003)(2616005)(446003)(54906003)(316002)(7736002)(305945005)(6116002)(2906002)(3846002)(81156014)(81166006)(102836004)(50226002)(6916009)(386003)(36756003)(8676002)(8936002)(66066001)(2501003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1709;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yUkh5+LC15kDahG+S2Q8hBXdcqn6LMMPwJUBuifrNN6TJG1DF/VSMOoirPXUo0TLye4OYn6NKLgDQ5BsVhjiPfoaVS0H/UaeUs+lLLZmltWKrA/1yfHJzIMadOlX8yPlhahzjDrTWinDNXsdky3+/IgKcMGrHxHr4x4YJCvHGJSQqoQHIh+82nTHNrutm74ZagmsDp6q/T9MfbKtBIV5OGxhtPoShkGV8bOQbgyOVV6rGy2HWR4JOtUnQooVUsfUlp0vHPQIIQH9JuxFavpjCZnk7Kd7cQVcXVILkDtLg6mZFznz8oJJQoU2L8ZFpgLj6zQPDK/AkRSF9ozfQ46jL4bRI758zS0m/9CwBUbmp8w/6PyOrlrhzJTGTRUZahk4LHdQG5+xJ/pQxN+VjUVwt6vwz0mW6oKarw+YuwrG+gA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1826e22-3325-4626-d08f-08d745fb1342
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:16.1186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g058PfiKJbFDaRdEciRO14mvlGYy10cgJ3Qd7roMqvZAvBu0OaAPYFLIM6TPXxoYQ9JtfQA3qiOhpX+TysnMvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1709
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When targeting MIPSr6 or higher make use of a compact branch in LL/SC
loops, preventing the insertion of a delay slot nop that only serves to
waste space.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/llsc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/llsc.h b/arch/mips/include/asm/llsc.h
index 9b19f38562ac..d240a4a2d1c4 100644
--- a/arch/mips/include/asm/llsc.h
+++ b/arch/mips/include/asm/llsc.h
@@ -9,6 +9,8 @@
 #ifndef __ASM_LLSC_H
 #define __ASM_LLSC_H
=20
+#include <asm/isa-rev.h>
+
 #if _MIPS_SZLONG =3D=3D 32
 #define SZLONG_LOG 5
 #define SZLONG_MASK 31UL
@@ -32,6 +34,8 @@
  */
 #if R10000_LLSC_WAR
 # define __SC_BEQZ "beqzl	"
+#elif MIPS_ISA_REV >=3D 6
+# define __SC_BEQZ "beqzc	"
 #else
 # define __SC_BEQZ "beqz	"
 #endif
--=20
2.23.0

