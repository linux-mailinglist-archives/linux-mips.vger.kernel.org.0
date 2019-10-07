Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7A06CEB04
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 19:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728459AbfJGRx0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 13:53:26 -0400
Received: from mail-eopbgr820118.outbound.protection.outlook.com ([40.107.82.118]:43598
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728187AbfJGRx0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Oct 2019 13:53:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6nL1djqFKFp5i8zlnhPnljW+lNWOGzjvR+m3yrQLLqA8TWZVUNvcn+1f3NCE1/IKqnBHOduj7X/oCL5xcKPBcWTk1X4Ph05zTe/PYI+WOpOWqfTM65htRkCIOcVUIYYTjVsTXM9U/mkf2iwQjH/Aav3DA47kR+56FRMP9mFeKo9KENlbSONZtm5nKJ4shi1SweE9JMlPpk14ANPgekL2pyLFRaoPk4SjhUPnTFgRnt/RxH0OGE/rvUBlM6E6Lcu1XxB7oc1NSQ7H+9vP7/Q+GNcD4jxw9c0Jidch3zUyOxvl9ClqN7YfsS5ZKUYCf30ELxzyI07CWooQbEf4gtMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKFa6f8405iJbuwv6hQYSUl2XOrRz7OiKBmyMBrAaco=;
 b=eVCpOj+nI0+8chSR8PVrAmOa0u8yVLEZb2fDq1VkdCwsTZbUzXUiUgaL0QM4LmSEYstBTG/slfeY3PootXoKyQJ3oa87ugVLYbXHSYUGdCTtEdhw4m8+uBnFCLVgDxV5wz+DiGkPRJwDn78Ocvmsbd/2dpOBCZH22QBicLmmH9IUaEPL37FrnykYlIFvTd2sr0kuLUOgaaq7tbDKAqdCb135IariM3FSg9x158Mrjgr673cI7C7U8quqFJyW6Pc4W9xwaEfbni6qbLfEceUm9TPjG+c5x/KOof4kMCkNw/rGDoDYGn2+o6iStCmMykk391XFU+CSBDoqlhfh6L2Yhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKFa6f8405iJbuwv6hQYSUl2XOrRz7OiKBmyMBrAaco=;
 b=H1wWy7YlIQv08pSRKbRiNDkwq1v8fhu6IFy6lBOQgxfntdhSv0+SoqWwJZrxMG60+VkkdoFcaZ2n4M4Lkpbj/0aYXv3ZNBDZ2h6WPRfmvT15Jx0auB7bNQr1j5NpFUDKVmEBNbEvdzMsFTXdD/U/numzj002SAyJvgVjnAC7r+Y=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1549.namprd22.prod.outlook.com (10.174.170.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 17:53:17 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::3050:9a38:9d8e:8033%5]) with mapi id 15.20.2327.025; Mon, 7 Oct 2019
 17:53:17 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/2] MIPS: r4k-bugs64: Limit R4k bug checks to affected
  systems
Thread-Topic: [PATCH 1/2] MIPS: r4k-bugs64: Limit R4k bug checks to affected
  systems
Thread-Index: AQHVfTgYTsev4RfgykmryYTit2Lblg==
Date:   Mon, 7 Oct 2019 17:53:16 +0000
Message-ID: <MWHPR2201MB12770C80CCD2C6788101384EC19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191001230423.70119-1-paul.burton@mips.com>
In-Reply-To: <20191001230423.70119-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::14) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a692af3c-895d-4252-61f5-08d74b4f3b4c
x-ms-traffictypediagnostic: MWHPR2201MB1549:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB154993595BCE9ACA26C3D7F3C19B0@MWHPR2201MB1549.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(346002)(396003)(366004)(39840400004)(189003)(199004)(52116002)(99286004)(476003)(7736002)(305945005)(54906003)(76176011)(25786009)(486006)(33656002)(42882007)(478600001)(2906002)(11346002)(446003)(52536014)(5660300002)(6246003)(7696005)(4744005)(6862004)(71200400001)(71190400001)(66066001)(316002)(14454004)(229853002)(102836004)(9686003)(81156014)(6436002)(81166006)(6116002)(55016002)(74316002)(3846002)(44832011)(4326008)(8676002)(186003)(26005)(966005)(386003)(8936002)(6506007)(14444005)(6306002)(66946007)(66556008)(64756008)(66446008)(66476007)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1549;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DKEsyLNyRhkC9nh23UyItu2v/GNk95dWp7AvabCtCjIisWeU85Cx8/ndG4IzEyxeTelZ7WIs4L/J42HjmVy61RZ56v2QJvvWUF8BmcwC5J5Bq0h/1DMWbw/E7oTJQ2gFwsSz8CEQkABlQXskxF8me2PXrqV6QeDJsr3rFe7V7v8Mvb/4+wcXfbF93QFXPRtk/g/q3+H2P3KnLd3B229MVv1NkaRtFtPud83JJMR/i8bWGTMZd57BKsV6iVqS9KdapGHxvXKX7XNuPIVTipLO/pG/LgBhWALu2eW0iFr5vRbZuYTqw9azXBCIt+6wceyJBbQ6JaCifZ78wb5QJe+SVGFbqtrXOX1sUpPDGXT9PTMq7dfvfvA5BnaKtxKjQaYtdjEksVBD2GQUHQPbWOfsW8doLyfU16+SvI5iUTaO5h2GepDBAmUBlGzrdyDUqQZjinm8M8JxRcjlRiD7fr/DaA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a692af3c-895d-4252-61f5-08d74b4f3b4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 17:53:16.8854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MeZknbJUinEcsT+EF/JzOR1Twi6Wwoz9XDYqFMJ97j3B8ZEowMI7qcWFis/euXGgGdaRiF43rJg+ruN4zLOMRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1549
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> Only build the checks for R4k errata workarounds if we expect that the
> kernel might actually run on a system with an R4k CPU - ie.
> CONFIG_SYS_HAS_CPU_R4X00=3Dy & we're targeting a pre-MIPSr1 ISA revision.
>=20
> Rename cpu-bugs64.c to r4k-bugs64.c to indicate the fact that the code
> is specific to R4k CPUs.

Series applied to mips-next.

> MIPS: r4k-bugs64: Limit R4k bug checks to affected systems
>   commit 071d2f0b5419
>   https://git.kernel.org/mips/c/071d2f0b5419
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>=20
> MIPS: r4k-bugs64: Drop CONFIG_CPU_MIPSR6 checks
>   commit 5045d06b3736
>   https://git.kernel.org/mips/c/5045d06b3736
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
