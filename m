Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3058016D8D
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2019 00:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfEGWlO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 18:41:14 -0400
Received: from mail-eopbgr800102.outbound.protection.outlook.com ([40.107.80.102]:9440
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726256AbfEGWlO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 May 2019 18:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52JZPTIvdwxuu5gd1VNwNvBRfABi++187A6Y8QAbSnI=;
 b=nCBcF9C4QLqetMCQUiA3tOR52DGOuUBTCkM5QEts6vcB6Kdgcx56yF4o2HHmk7vI0Svq7b3m8g1qGOhbbeXsEG0rnIzhjcpPGsIX6m+Zq5I0GXjcGsF80YnFqF42VF/5b70OMnwCDaYTWhwle0rXtd5XebQPQfpmaX+xixPtRuo=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1390.namprd22.prod.outlook.com (10.172.63.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 22:41:10 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 22:41:10 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Serge Semin <fancer.lancer@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] mips: Print the kernel virtual mem layout on
 debugging
Thread-Topic: [PATCH v2 3/5] mips: Print the kernel virtual mem layout on
 debugging
Thread-Index: AQHVAdjen1ZtC4ijSU6H00TkGOPWpqZefB4AgAHKtYCAAAFnAA==
Date:   Tue, 7 May 2019 22:41:10 +0000
Message-ID: <20190507224108.qhoxlyrdvgwayb4k@pburton-laptop>
References: <20190503175041.7949-1-fancer.lancer@gmail.com>
 <20190503175041.7949-4-fancer.lancer@gmail.com>
 <20190506191419.w3qtkgcjrjjuzwmu@pburton-laptop>
 <20190507223603.ewuye6lutbb5wz2l@mobilestation>
In-Reply-To: <20190507223603.ewuye6lutbb5wz2l@mobilestation>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0051.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::28) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2f3fd21-7afe-4484-1606-08d6d33d19f9
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1390;
x-ms-traffictypediagnostic: MWHPR2201MB1390:
x-microsoft-antispam-prvs: <MWHPR2201MB1390F3024EEFA9B204F5453FC1310@MWHPR2201MB1390.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(39840400004)(376002)(136003)(366004)(396003)(346002)(199004)(189003)(51914003)(6436002)(3846002)(5660300002)(229853002)(33716001)(52116002)(54906003)(99286004)(58126008)(386003)(6506007)(6916009)(6486002)(4744005)(66446008)(64756008)(66476007)(66556008)(1076003)(71200400001)(7416002)(71190400001)(66946007)(14444005)(73956011)(256004)(7736002)(6512007)(4326008)(305945005)(66066001)(25786009)(68736007)(14454004)(53936002)(9686003)(2906002)(476003)(316002)(44832011)(76176011)(186003)(26005)(102836004)(446003)(11346002)(8936002)(478600001)(486006)(81156014)(81166006)(42882007)(8676002)(6116002)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1390;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AO31BmBK+OpXoaJSAghjKWPf12c6mU/gU/Q9lsv3INLoIG50LL0KRvL4dUfkUoUoNaKLk6zIs0O9IjAIQ0/nRzpa6caH2nNHPcqYWHJTBDtFcOv5zzPzHiXBeYyxK/wLJ1v7Epb3CUh9iESbydQw3agDSttzFls2CpOt226In+icB5gJqZrxEm/CDdtTIhdrbVVotAHOAaW4vygMK8zgZ3cuu41K/ypu0tSZRpTOdAP52/d5+eQ+iZPT6L/+wgmfhVo95UnjYtpUOfvaHB21qAMEriKZG3KMBnFCkYBduam1DH/SIP8XZJorofqB+x8y20LYvRw9KBUy3i+HWHq87ivbhXKD8pm12R+LZ3dGJAy1WQpHro29jC/IwNDVYMnzGwlUsHdZWT2sOJdazrdQVfYGbug/8LPoF/jiuClhsAs=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C38B9B9C36F8004E882934494444F881@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f3fd21-7afe-4484-1606-08d6d33d19f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 22:41:10.5757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1390
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Serge,

On Wed, May 08, 2019 at 01:36:07AM +0300, Serge Semin wrote:
> Thanks for the report regarding this issue. I actually thought I
> tested the patch being buildable for 64bit systems. It turns out I
> didn't.(

Easily done :)

> Should I resend the fixed patch as a separate v3 one In-Reply-to this
> v2 patch or resubmit the patchset with cover-letter and only the fixed
> patch being there?

Replying with just v3 of this patch will be fine, no need to resend the
cover letter.

I currently plan to submit a pull request for mips-next as-is, without
this patch, in the next day or two. There are a few last minute
submissions this time round that I'll then queue up & send a second pull
request next week, which this can be part of.

Thanks,
    Paul
