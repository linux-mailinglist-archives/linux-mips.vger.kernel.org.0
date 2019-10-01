Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7707C41D1
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 22:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfJAUdR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 16:33:17 -0400
Received: from mail-eopbgr820095.outbound.protection.outlook.com ([40.107.82.95]:26009
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726287AbfJAUdR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 16:33:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcYywzAcwFfLrrlO7lGN3Af1xEqW8rlv+2E1yY3rVJphkymbCh9hLDMd/x/rKvw+muYvJKrOMgh78mht8qhmNK6Bk14TP0N2KqQFPDSF/4J5xZ0Eht/lf6tUiYwQwQLOQgn5AC7r8lJcxSGMNXviojhJ6OlRbNJ/1W4qNwRYU0sa0zVulzCNjYJjwzUclAISDeZoI8xlp5LkwED9pEHSiAp+v/di27jdS/1NFJD6E2asCgec8z8tHs0G9bIsMG3gGjztqjGRTYK/XJ47GfoV5GzaKFZVttzzX+sl2dd8juCPEIMctCuWFjz09H563NysH+AtAuoCNaGcBhaYumsStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4czECiE6F5+hNqC4i+Hz0tCHzYqo/uD0te4uJEKfbJc=;
 b=lNRvBv8j7L/vnUgr0isNAWD0dvi50M9jaFcGW7imN2xm7AVMQpSryb8sTHI0aUxVrSYGE0hNq1TolGzJRhBv0oIrkdRseriJ0imqwMehRWp5QlUhIE0uffhCCl0LNOj05JXVDylpjsXEkmOxi7uWrxCs4ky515Wu6YETHIy+zvCNukUOr1Ukj7uQ6oDelfYSe3PospAXXsik30/sb7EY3bk0k7R74znWUxxyt2lv8AifA2rYxYJsjjfvq90DqdApgzvVR9wnbpWsBjd+lSTQAU95RUNzj/2S7TtXkjPmImTeZHaQ2aRxrgTIm5/pOIk61SMWsNd/FlJDpXJzdp7HNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4czECiE6F5+hNqC4i+Hz0tCHzYqo/uD0te4uJEKfbJc=;
 b=DgI+FDmFk0/GkaveGW1WuCPzJnXcOMnUF9/MPZNz9tnPx9awT++JVyPXJdLZWrgOMrvX1eNZMvZWMSc0it7qXQdij1g8OprJG/Pc4mlfgJul1CppuAk/S1YaxADbclJXX4OGlY9JkSTPIaDHwzwSuYWbXWdmWtAUWUaZ/GqRqgA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1293.namprd22.prod.outlook.com (10.174.160.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 20:33:14 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 20:33:14 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: cpu-bugs64: Mark inline functions as
 __always_inline
Thread-Topic: [PATCH] MIPS: cpu-bugs64: Mark inline functions as
 __always_inline
Thread-Index: AQHVeJdyS8SpctoV4EOsscOeZnZ6Fg==
Date:   Tue, 1 Oct 2019 20:33:14 +0000
Message-ID: <MWHPR2201MB1277B32E583C7865EF29E4D7C19D0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190927053339.11866-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20190927053339.11866-1-jiaxun.yang@flygoat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:74::24) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22cc4bda-0775-4c05-161f-08d746ae9551
x-ms-traffictypediagnostic: MWHPR2201MB1293:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB129331AB7E54C3C90CFC7244C19D0@MWHPR2201MB1293.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(136003)(366004)(39840400004)(376002)(199004)(189003)(26005)(76176011)(305945005)(52536014)(81166006)(14454004)(6116002)(3846002)(25786009)(6916009)(102836004)(8676002)(2906002)(81156014)(6436002)(42882007)(186003)(4326008)(71200400001)(71190400001)(5660300002)(44832011)(486006)(966005)(6246003)(256004)(33656002)(478600001)(99286004)(446003)(11346002)(4744005)(476003)(54906003)(74316002)(316002)(66066001)(8936002)(66446008)(55016002)(386003)(66556008)(9686003)(66946007)(64756008)(6306002)(229853002)(7736002)(52116002)(7696005)(6506007)(66476007);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1293;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hN/KUeiJh3Y8a01IoA2hivmXs1OuxZ/r3v1QMbcPUSlUbuNdxmANsi7xAgC6VffiMbnGzugAIE1DFu5WJFnn4n7s8COzUSabitanQJXe9xVpZ77ktN3Ob61wpsL8Y1gu+FipBwz688HSgqjTqyRSi7H5+DDWJa0NHdtv/r6wuSI7zq9+kb0T0cEZwqV1L8o9dYz+Fnzxkrnw0qcuEEDrleDzvYo5qPeLn36xXXdp0VmVyD8M/x04sBed4acX/hdCC9BTpCRcEO/07ZAiW430q+1zxBem0nR6yyELsV4hvaOoZYw1LoFNp6FOA6ZzHu6fdbhgvfzQsYDm+pJKfHL0RffGnSQGo/WM1XkaDZoB2W0XEzXl++a8n/yIteZbK/1caZwxC1OwSdlhpaXZ5qRfZtKjc2X4xOFjWRueGWBqXjCB6iinP4UqM5k8N3Qz3WgCH6dh7nxuPXWTh/cj/DnUXg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22cc4bda-0775-4c05-161f-08d746ae9551
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 20:33:14.2336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K76DXnkwAIyucnEn31hSgrsOS+c9HTdHWMG704IrAseOqD2/FHMX4DccSnSWRBPkJcExspFtJVQyotrXQRlsMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1293
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Jiaxun Yang wrote:
> Commit ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING forcibly"=
)
> allows compiler to uninline functions marked as 'inline'. Leading to sect=
ion
> mismatch in this case.
>=20
> Since we're using const variables to pass assembly flags, 'inline's can't
> be dropped. So we simply mark them as __always_inline.

Applied to mips-fixes.

> commit d345d9cad225
> https://git.kernel.org/mips/c/d345d9cad225
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> [paul.burton@mips.com:
>   - Annotate these functions with __init, even if it only serves to
>     inform human readers when the code can be used.
>   - Drop the __always_inline from check_daddi() & check_daddiu() which
>     don't use arguments as immediates in inline asm.
>   - Rewrap the commit message.]
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
