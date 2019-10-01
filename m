Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92AE2C4349
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbfJAV4m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:56:42 -0400
Received: from mail-eopbgr690134.outbound.protection.outlook.com ([40.107.69.134]:38470
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725865AbfJAV4l (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:56:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lF99ee0F9x5ia+x52KtK57H6Ku73udp/cNKuXdwAX7VarzSuGM/FUtoCloDc6mmwMHHxhlOfUkSCMhY9QhcGDJdcRHb9XmVxmzAZLLZCv5sRlcbC2uAEXJckdevrvKJSZ4HG+pX3vHxYPpoLYWwsnCJO4BfT6Imy/ifaGI0fR0f5WoX1eLpv+QbIjqS+Qy/Nfl4HLO5B2vxHNRloZiUTzgPyVHTANh1Kqs8gSfI+JD6ZIpgE5q4ke2+0WngFU99E0qkh7wFor9phrIhErm1Q7Ig4b+c1XiCWx7VVyoNTZFG7BNAHgiW+mZzqhSJWNin7ES48h85ftqF39kX/+r+trg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfHQFKs92Xn7zrFZtN2USsFKpDtmFlQ+p5APlyxkuHk=;
 b=AyCbCAb8sqAmpqYC1fM7MMyYkDCwDLQt/pkSeiFcGImXq9kwZG63H8IYfuWZHKQHddItc7DJFI19ijYxgjzn3dMOKMt7qDsuljcTcwwtumw7/wpT4WukiJkC0vp0njxaT0MP9YrkpZJiJUbIo6gi3yFWiWMLGADp530dT++c6ozBRaBd7DNANRvvR4Qk/jiC2prNZYHNC9uf5wIF6nC8Q/SzvA9SWfp0jOzNTxpeNRqxc5jmyqHN1oQ96LZ62G72npohos0GpFgfN+KUvWFuLiWLt9LR4IzsQBGQDeKUe1k/7prRIFskrqs/rHpMj8jPE3tEIHsHHnbTlkT6Qy9/qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfHQFKs92Xn7zrFZtN2USsFKpDtmFlQ+p5APlyxkuHk=;
 b=ccgmZ/B2vAjlRskY7xdyLADCqTh4cue0jq3zTLQ/XfdKE5jmcqB3FgzvJuuytDnkgx+wlptfVfI5zEJbkbirfloTrO4/8ImRehAU6yJnkg5fxKNBTcUC+LoOKnWbaK+GZDos8ruVGZ+hNEtFBvT7pbBwbHmeU4gbAmPZDWcT/lA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1581.namprd22.prod.outlook.com (10.174.167.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Tue, 1 Oct 2019 21:56:37 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:56:37 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] MIPS: octeon: Include required header; fix octeon ethernet
 build
Thread-Topic: [PATCH] MIPS: octeon: Include required header; fix octeon
 ethernet build
Thread-Index: AQHVeKMZxSx9XDOl9Eeu4KFjJ6UPrQ==
Date:   Tue, 1 Oct 2019 21:56:37 +0000
Message-ID: <20191001215622.4173931-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0006.prod.exchangelabs.com (2603:10b6:a02:80::19)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71ddfdd0-e2db-4c9a-ca4f-08d746ba3bb6
x-ms-traffictypediagnostic: MWHPR2201MB1581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1581B3C27A2194733CC136CCC19D0@MWHPR2201MB1581.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:473;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(189003)(199004)(36756003)(64756008)(1076003)(42882007)(4326008)(66446008)(66066001)(66946007)(2501003)(486006)(66476007)(14444005)(256004)(7736002)(66556008)(71190400001)(2351001)(2616005)(71200400001)(5660300002)(50226002)(44832011)(305945005)(2906002)(6116002)(476003)(3846002)(81156014)(81166006)(8676002)(498600001)(6916009)(8936002)(26005)(6512007)(14454004)(54906003)(102836004)(5640700003)(25786009)(386003)(6506007)(186003)(6486002)(99286004)(52116002)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1581;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j0SB4Xa8y2TJPhSAAUXHx4EaRV0A2F6zjtJ1wqpx+4sckLEG8mUIUM6mYaIaQ0cSImJv2NVu3wNy+lh84B+rMVaodv4C3t/POVAofxFlu5GH7Ea82ZlTU9v/7pGT8JuyIpeyl30CyhAKe6viLZ7Yrq/nCdnYC5+3BTo5CqPHSg6TpjVRzSqMKKv0McptEEjW4vb6tysbQNv+FeSZ40my2W2CmQqE1f7wdIfYhlb1Ptm2gPWcDWAtO6UvbSTaruVoa+Mx7IdnmKso4dMHlmpFrR1aFe6tOVb/byb9f2V3ZIvHNwQaSxk4qgxrWq00LMREQPsxRqeF9+wLVZ1aEos/HBUJzwYcJ5TTW5n3f5KK/+D8Blu591nOncGAXLwB1yM9qrLp/qHruhcF2gOOnQ/cNur/pT3DHbsBIyq7vEAhxDo=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ddfdd0-e2db-4c9a-ca4f-08d746ba3bb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:56:37.7820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3D1cxE2vGztVTp1ZptvtUuo1Y8RLBQXkz+Os5Q1hEY/EAu5nLq+9uzpVkCuc86sHJqSTTGm2iCVqbACZtN87tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1581
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 171a9bae68c7 ("staging/octeon: Allow test build on !MIPS") moved
the inclusion of a bunch of headers by various files in the Octeon
ethernet driver into a common header, but in doing so it changed the
order in which those headers are included.

Prior to the referenced commit drivers/staging/octeon/ethernet.c
included asm/octeon/cvmx-pip.h before asm/octeon/cvmx-ipd.h, which makes
use of the CVMX_PIP_SFT_RST definition pulled in by the former. After
commit 171a9bae68c7 ("staging/octeon: Allow test build on !MIPS") we
pull in asm/octeon/cvmx-ipd.h first & builds fail with:

  In file included from drivers/staging/octeon/octeon-ethernet.h:27,
                   from drivers/staging/octeon/ethernet.c:22:
  arch/mips/include/asm/octeon/cvmx-ipd.h: In function 'cvmx_ipd_free_ptr':
  arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: error: storage size of
    'pip_sft_rst' isn't known
      union cvmx_pip_sft_rst pip_sft_rst;
                             ^~~~~~~~~~~
  arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: error: 'CVMX_PIP_SFT_RST'
    undeclared (first use in this function); did you mean 'CVMX_CIU_SOFT_RS=
T'?
      pip_sft_rst.u64 =3D cvmx_read_csr(CVMX_PIP_SFT_RST);
                                      ^~~~~~~~~~~~~~~~
                                      CVMX_CIU_SOFT_RST
  arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: note: each undeclared
    identifier is reported only once for each function it appears in
  arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: warning: unused variable
    'pip_sft_rst' [-Wunused-variable]
      union cvmx_pip_sft_rst pip_sft_rst;
                             ^~~~~~~~~~~
  make[4]: *** [scripts/Makefile.build:266: drivers/staging/octeon/ethernet=
.o]
    Error 1
  make[3]: *** [scripts/Makefile.build:509: drivers/staging/octeon] Error 2

Fix this by having asm/octeon/cvmx-ipd.h include the
asm/octeon/cvmx-pip-defs.h header that it is reliant upon, rather than
requiring its users to pull in that header before it.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: 171a9bae68c7 ("staging/octeon: Allow test build on !MIPS")
Cc: David S. Miller <davem@davemloft.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
---

 arch/mips/include/asm/octeon/cvmx-ipd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/octeon/cvmx-ipd.h b/arch/mips/include/as=
m/octeon/cvmx-ipd.h
index cbdc14b77435..adab7b54c3b4 100644
--- a/arch/mips/include/asm/octeon/cvmx-ipd.h
+++ b/arch/mips/include/asm/octeon/cvmx-ipd.h
@@ -36,6 +36,7 @@
 #include <asm/octeon/octeon-feature.h>
=20
 #include <asm/octeon/cvmx-ipd-defs.h>
+#include <asm/octeon/cvmx-pip-defs.h>
=20
 enum cvmx_ipd_mode {
    CVMX_IPD_OPC_MODE_STT =3D 0LL,	  /* All blocks DRAM, not cached in L2 *=
/
--=20
2.23.0

