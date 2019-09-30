Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C10EC2A6D
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732449AbfI3XI0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:08:26 -0400
Received: from mail-eopbgr820107.outbound.protection.outlook.com ([40.107.82.107]:31072
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732442AbfI3XIZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:08:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmkH5iBoqeTWwS4LppIFhQMNw/n4+j7qG8Tb37lD5bX6NnI+4l0NYjhtAcJTf/S0zYt7L4VVD4ahqg41urQbYEYrK9oQj4npcXD9bVDb8T0GZExnq6i9aPr/bp4QXvyVx/8by2oepx3fQvpV3pqZ2sKEJ2vsbwARYSf014IDknMfeMg4hPDaAwZ7xJHcZGAztzOsW4egu39p1kjfSQTGwHe1cEWF9RCPIvhTI5mrMbnu7lQN1CbfEztZPgKM/1pz0vOv83JKp4Rz8IwcMuABNwL6n498DfrbGyJ2dxNZNgfDqe0nva/0DXsdAX0HxBzwlbcqz/wKlQXw2kFwksZNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYcC9mKEo46j5Wg4Fl2eCtfvmNKEM9uZlKj0eAO/wJo=;
 b=JBLEC1pnQWPFDZovatV6jaEsbDCPbPBpKffPkDvkneORDkoaKDp7MFgPEG6WAy9g98o7Qj19Fsa1oFVr6F6oKUHZRRKfYlDek0kG9VUvLqPeMP9+lOfVoX59pSA6Xor88Cgf2YZnnYI5c8v/VLd/V7SOtFXCGkB0SVLk65Mw2lwydr0OVbtThUDnwLPdQUTpnBDs4U2iTIPbr0O3cgdEy4hb2v1gXFaxYf51SFRBwt5ta7fNo/L8mv9j+LWjyGVQg+oIbFaPfq2QHhFsgq1THNUzAFWMGjll4do2wD7GgrTPs0cIVNXnCc+t3zEOKk/2rKzrd/3xUZqaJ2T2wLhWeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYcC9mKEo46j5Wg4Fl2eCtfvmNKEM9uZlKj0eAO/wJo=;
 b=IoDBS8JWM7Xtq9i4BbSEOqOzKzZ/psU0B1aes2I3SCVErVkoaESsKw2Dxk3jXwGzEELRFGKuZV74Yfgow1AS87J16vFTnFtdLiuuZqyDl7u7L6AVecWIpZTNvRtw3nS8Uobuh4cFPgiQuqnAsl6LsOtA167WLKapM73ezE4tJ7g=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:22 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:22 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 08/37] MIPS: barrier: Clean up sync_ginv()
Thread-Topic: [PATCH 08/37] MIPS: barrier: Clean up sync_ginv()
Thread-Index: AQHVd+P0/JqjG+YzWkiVbYN4mNb0LA==
Date:   Mon, 30 Sep 2019 23:08:21 +0000
Message-ID: <20190930230806.2940505-9-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: ee453716-8953-4883-393d-08d745fb1687
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022BF80E8384A0C69E3EF9AC1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(189003)(199004)(14454004)(508600001)(256004)(6512007)(81166006)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(4744005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 94azVCmm9mpsEcjOw0iRoL/2B/trP6Yk4L1ATO4u0rTmqO26VCY/mzX1ZcB4UjHdxoLfzuoEvmyixwXDKI7drDW9EVnVtR6l1Okd1ipIeloo/m1hU7gJGrHnkKOi02gIONayYiMhFNoCVDQYrN0KtCQoAYyOkMchtLhe0mpgCfB2tDp8puA7T1MBlUY7eNG3vgDGadpTsNmqC46bB019FrkccQwuJJbSqHXU93aNpY8O0AZ5XqgFJnJNRNsabVg1HlABv0OMF646fiMgw38iX1hT7zIzkOtOtuN0vVZaBsIuY5WRloYCNwGYWaUkfh6OjY8v/8grineF8IYa1tAHdXCrz3PltuxCqY1Bey8qgP2UuGdKJ3fxX95z4K5cVpv8b9z80MuF+h/uT6J0BdPJBkopdn7C3TzcbXuKmVebnj0=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee453716-8953-4883-393d-08d745fb1687
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:21.5592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rRc5YqPDAf05E0AjEh+njN/lK4D32aVh1PccH4qkWqL1Svljg2bU5ZhqsDVdBgsuDjIVUlxfPuyyQFc0/PcIDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the new __SYNC() infrastructure to implement sync_ginv(), for
consistency with much of the rest of the asm/barrier.h.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/include/asm/barrier.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/barrier.h b/arch/mips/include/asm/barrie=
r.h
index a117c6d95038..c7e05e832da9 100644
--- a/arch/mips/include/asm/barrier.h
+++ b/arch/mips/include/asm/barrier.h
@@ -163,7 +163,7 @@ static inline void wmb(void)
=20
 static inline void sync_ginv(void)
 {
-	asm volatile("sync\t%0" :: "i"(__SYNC_ginv));
+	asm volatile(__SYNC(ginv, always));
 }
=20
 #include <asm-generic/barrier.h>
--=20
2.23.0

