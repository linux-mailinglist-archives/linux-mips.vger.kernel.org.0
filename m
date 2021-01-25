Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3723303007
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 00:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731932AbhAYXSb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Jan 2021 18:18:31 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53370 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732458AbhAYXSF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Jan 2021 18:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611616685; x=1643152685;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=886OP0etOJ/ghIJ+/S1Cup6EZMOmS5VWfF3RhOQWbsg=;
  b=SFVbeiGyl4npiLB6pTmk3AROQkbVwsyLb/esEKvuzTEs6Nf0O9z9aR+n
   MSMmEjwP8CDE4Kw+y2rsKAJ6uUzBEH365yW2N69fMCeFRvgqCAbhjSJEd
   1E36FNmx8r8whzYzzXZKjvGNDaFomktKSnolEkFLGBRoCe4rOJU3IIT6l
   y81Jwyj+TYiQoROdB1BB/BID/f2TXctTdV8EAfJ7XsLmFU2/daiunlShz
   GOiJYuIGd/snNb428ZbZEvR3Ty2xqsP8zQs0rOjvJDCVY2yEyW8cT0LlJ
   rDrgDUM46wuIfXn6yleoTR4MdnfXa6e4Hq9UHMYUVvz7XR0//c/AEwM2O
   A==;
IronPort-SDR: FtKhhIFW9lTDWkJ8DOC4gXbX+HOLByMY1FiXA4+K5GDCwbYKsT4nvtyruD4wR2SWHOMhotWsJB
 ASvfxyuYZFPCUId1FQkH/pIJSMH1rmvHPiP/5Qr3JtkyqN6QwNfuv3V+uigTfhBWKBKVAxEc+q
 ZE2719fGjtHXk6PnyXCarWIWMRHDNuaG0ya36QhYVmvsis+48ZLQwpCucuZphsT+b21MQXFXIU
 PGf4hYrJoIAgve0IdxJ0XzA6HFeBMjl6bGnyODpFXRKrRTA7Q5qSdlHH+wNgvo6PwBT8jcQunF
 gJM=
X-IronPort-AV: E=Sophos;i="5.79,374,1602518400"; 
   d="scan'208";a="158295173"
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
  by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 07:16:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNyD14Mh2Gf4OfkEE9nT4W3BHnY9Vlg5yVu4KUi5snkNcSoCLzd46f8BZN1P+AzVGMdnrtW3BFUCUrv7z0lmP91C9jqcBdGR8pYLQaLXgwxGbu4r0TUqxPeQUsotwgDcuzoYsZaNcTecGQkLF0fs7tghNl5J9nw9muD1sX2DSvAmZuJ/1MVrONPPEdl20DJxU95ecMDXf2FrdK+76AoQcJWhSIDB4zrvuQBXuJVh6XqTdrB1DQK2SDZ7vP6U0qpiNC4LAKK1heVPvTFlvO+pdMkqDm/GSdveBWF1/lM+nMSmEyrLaxS/PVSq2r2UYKQ3qLnm/L+YXj/8ZjlZGwalOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=886OP0etOJ/ghIJ+/S1Cup6EZMOmS5VWfF3RhOQWbsg=;
 b=C7Et4Hnf9g0ulRy10XlqsxkeLV3ryK+IsBjlb8Zfa5OhOq4g8iBZaXGMZoWSf87KR4d1VWYr79F+2qRaaTfsQvlO6rsbVkRSqZVtZ0b92t7VOtalnVC0lksQSL0S9UEjRFMBq0NINvqnrJZ9ZL5HDPuU+JK5hYski57rAgvFXp/kQWnlb9w8QP5wBOrO2xPMKThYnuFCcoSMt6DjNEorSqa7WOeCKInriQdCNV38hSNGUif4lKyhctUUmMDch+KbIfLRm31Imesb/EoXZ0jA2hBEeUrTN3os4YTZnLBOCMUXVTb42GyMZhbykj6pXEOOaDDOJZAnvi645FL4WmZMsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=886OP0etOJ/ghIJ+/S1Cup6EZMOmS5VWfF3RhOQWbsg=;
 b=q+1pantZPLzsyAZf0u00hJue3V4Ow1+MSYdUO4awlDGW0WVGmoqY9dXL1Z1myY8yKkB73pbeT7iU3yL12NSySV9o7iT5VZVvJFsfm+JlUlyRnH4ZIsaJzWSD6kbm0cZzGb+YD6cxSA7jF9RMelvoL42r9NaXlC0HQSlr9H0vwyM=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB4519.namprd04.prod.outlook.com (2603:10b6:a03:15::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Mon, 25 Jan
 2021 23:16:54 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3784.016; Mon, 25 Jan 2021
 23:16:53 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Lauri Kasanen <cand@gmx.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Keith Busch <kbusch@kernel.org>,
        "hch@infradead.org" <hch@infradead.org>
Subject: Re: [PATCH v11] block: Add n64 cart driver
Thread-Topic: [PATCH v11] block: Add n64 cart driver
Thread-Index: AQHW8V0RPSwnc2UUP06/pmxPHYESZg==
Date:   Mon, 25 Jan 2021 23:16:53 +0000
Message-ID: <BYAPR04MB4965DCD53EB7036D57F269DB86BD9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210123095327.58e5ab6c05f38e9080a79bd3@gmx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmx.com; dkim=none (message not signed)
 header.d=none;gmx.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d4b8a858-8f96-46be-b4fb-08d8c1874d81
x-ms-traffictypediagnostic: BYAPR04MB4519:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-microsoft-antispam-prvs: <BYAPR04MB4519F6FD769F56D04F1D031E86BD9@BYAPR04MB4519.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /aexxkF2a73bfuzsndk9j/U/Vrba4mPtSj1oXjNsw8Frzgwf22MqOSuM0ltRy2fZ88fe+wV5id61lmktm6pzLrMCdPxEXoxWSQDbDPdS+/ONysXgrXnfb1A9mCG/Ct6BX60jxUJdHBpt49UIABjpxJv0sXrzCvnvW4ZFfeqNICD4tNzl3Mx0/MXY8gs8vwO3y7zI5i7Y7NLrp2ztoxj+pMBDV8IpZNVLNgpTtRd4/PjCLU7TLBYozCU40WYVBDJN1S8IUwZYZStr+8gqa+K88sdTK2WA33rkG4IIRYbLhobJqzvKyLIHOQ/SgHFPmDIw92HnY7sHkB68wFXqTG1DM2YGfycoKXJe0WcupiOaNTV62mj0ikajLj+rVKiW5lfUqLjJNBf9EgFdZOw/Hp3pug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(6506007)(4326008)(8936002)(66446008)(86362001)(66476007)(76116006)(7696005)(66946007)(71200400001)(478600001)(54906003)(5660300002)(186003)(64756008)(66556008)(2906002)(33656002)(9686003)(52536014)(55016002)(316002)(110136005)(53546011)(4744005)(26005)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?A9Q9b6sAs9/bTgKHOqaBc8SddQSo/kgEY7Nh5Mb03UXLXCo4hr8IdDbxlJkh?=
 =?us-ascii?Q?A3E0UXEx47mtuRLxom0Xz0wSNzIwWlRTUgCbXN6wmA8LD7+/WU7abnvV9AeJ?=
 =?us-ascii?Q?MdXVu9XE2KTaOLx6a5weeV01qvFrDIGylotZ0gMRRChfzJpFzjCPaTDsqfgQ?=
 =?us-ascii?Q?j2QXfszb3NgU0OgQ4K6XKJDZ28/GNaWP8tfO+uKmttH4WF/myRXCzzRar98D?=
 =?us-ascii?Q?gH+S72xTFZSHYNmRrPvellfkc5bhNWdJAdx4hn0EJas/jCAnUE5UvFpILg/w?=
 =?us-ascii?Q?bQqhBvvStPJZCTcCKjDNpX0wNbc4O0SOsSuM4kdDnr6Ty1hwVJrqWBRI+A6n?=
 =?us-ascii?Q?T7s96ZeMUjUGVlyF0z97lWeGckgJaPer0sBBbizZ6kKxgz9lUTFSY2swAthY?=
 =?us-ascii?Q?ZMl8p8ppZVyVSFB0+KOxzU5eMp7JJa9lxzX1XpKSGFMPLEoMqSuWnx758xXT?=
 =?us-ascii?Q?Ljz6T7iF0LPrra181LqFKBmA/W99vsdivpuwRzI58aJbPhesuiCgR7e3kcMe?=
 =?us-ascii?Q?YVMV2xRyFO05c0CMAN5L1GH6K0J9zlnVYOrvV3vTGwtu6XT88b3bhpheyJFY?=
 =?us-ascii?Q?veB/Fl8tKYjjyLDR0lqJTLPL3vcYuQ0u/Aro1gDLQ0anrZzYiKdwRzVCgWEj?=
 =?us-ascii?Q?0LhBJaeZ5YlVOX9YUfCH+2WOhgrZtWNQq3brVln13VyDEOH2c2DdlvT67EIW?=
 =?us-ascii?Q?atBUG9bjLyDT5b+xMyU+cW1kb55q1KvQ1U1hPImQPQlB24vFLPDHruNsPRvu?=
 =?us-ascii?Q?nqpY1yVz7I0IWxvf56QOmL53BoPzaqujfKZ6OCY/KcTZdWuq4Zk98ClvDs7K?=
 =?us-ascii?Q?t/iQkbPK2tDNTApJ10UDfHEtLdC3qIGbeFc6vVWOPy3gbZdQtjQDTChb31ZU?=
 =?us-ascii?Q?SQWtMkS982x/mfrUEooX7g1qFy1jPoaKbp0O60v5gfD9mSltAK6wmqVKEyJC?=
 =?us-ascii?Q?hy1S4YalUfFRYChEx+h6r5IKs9Uc542+0IheHB7roQ92iIhT/E3rScy5R0D0?=
 =?us-ascii?Q?2TtaL9no4WXylPBB8IKe41xhpZ6DmiUNAPHVQjf7syxPJrxI49Zsa0AY0Gf2?=
 =?us-ascii?Q?5HpQzTWSDQg3c1li2uqtP4HymaEJTw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b8a858-8f96-46be-b4fb-08d8c1874d81
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2021 23:16:53.6507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EslA3LNU338pcFoTs7zXwivM9y2sOKYNf7XwPOi/gioINvE4STD5liRX0aEEO6ZCZWHt0pQmQU6ZkVn0+2dQz/8DFIfGUosGpCRVQ2f58hM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4519
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/22/21 23:55, Lauri Kasanen wrote:=0A=
> This adds support for the Nintendo 64 console's carts. Carts are a=0A=
> read-only media ranging from 8mb to 64mb.=0A=
>=0A=
> Only one cart can be connected at once, and switching it requires a=0A=
> reboot.=0A=
>=0A=
> No module support to save RAM, as the target has 8mb RAM.=0A=
>=0A=
> Signed-off-by: Lauri Kasanen <cand@gmx.com>=0A=
>=0A=
Looks good.=0A=
=0A=
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>=0A=
=0A=
