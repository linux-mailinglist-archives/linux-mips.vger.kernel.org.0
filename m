Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3396D5403
	for <lists+linux-mips@lfdr.de>; Sun, 13 Oct 2019 05:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbfJMDbR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 23:31:17 -0400
Received: from mail-eopbgr730095.outbound.protection.outlook.com ([40.107.73.95]:64839
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727492AbfJMDbQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 12 Oct 2019 23:31:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHGaRtShuzS6IueVSZzMqO4okFv0zru/H1tRPd4c+CwfYha+cR2NurR5qhyN8ZX4fHsuRjW6ce4xImbt3zrU9+YYQSAvxA/sZbG+fzzfLax7KopPhXm5YqiB0ElOX0qivoEpKPeHJqD40UiyOh7oBCCkS1Y7KkuzhKfAQQ0JKxY3rrShcqnh+elju8b0Qk6hrDj2aLUhWVNUc0JDeyTvISTz+9m5/iLiPOUcZdmXRvPlVYEhjb8BaXC39QZD+nAg+JvlEsxnnDxaxlQs+nwuTUCBPZm1XlNInL2PIrbHpqY4VT1dSx3xAVTONswc4fDA+j3p3/wJJYaeD3ulDeDwiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fetFGMIsLh012ohcyZaNNtCEqutjHcXRXVrdIi17i+8=;
 b=WcEsN2+4Mk7FtxxMMxfdjb2NnwhQFbCDTmkHdn1w/N25Ou6RCHYphqs4cFhD1Li7OySbsXJ76hCe5kLvXeMV7Ys5zozFB63dmNX4+DLN9g/AMXfJqBbfNSwYQYcFJxR58KBnKsBZp9zdHIUPYiKG5qu/VG1M8myX092ROjx3INvA+D3Kh0YH/bGTgAv/Vpeh5iMv+uD8l5MVC6oXh0wk2s9HX2GuxRLumFSfozhw9CfRBAYCmEoGcYrWgsR+39Vpb8UYv1ZVSJ7Pa1m9gJCKvu0NQNjHeXe7NVnlAAqxMJ8wy28H6rfsxUfd99SVaVissjjNiD/7pVVxRWMDF5u0Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fetFGMIsLh012ohcyZaNNtCEqutjHcXRXVrdIi17i+8=;
 b=iNf0wdCCknkcmMcV6WTYL5SghfaxCyn05v2lat4je1TixCKa+C7YbvdMVhtwIPnkRkAEtgQkYQbpl3fI8dmDEb41u3Q36fsWfu79BdsZA97Yg017RafxYep7bKTNrpX1DdFkq/j5+xLz4ZqLdtSX/lOApHUihbovipSGVc5ch6s=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1295.namprd22.prod.outlook.com (10.174.162.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Sun, 13 Oct 2019 03:31:13 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.021; Sun, 13 Oct 2019
 03:31:13 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        kbuild test robot <lkp@intel.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/3] MIPS: Always define builtin_cmdline
Thread-Topic: [PATCH 1/3] MIPS: Always define builtin_cmdline
Thread-Index: AQHVgT248msMlm/E7UGQ68Q2elJDbqdX6tQA
Date:   Sun, 13 Oct 2019 03:31:12 +0000
Message-ID: <MWHPR2201MB1277901C92F089D28E22EAA9C1910@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191012204326.2564623-1-paul.burton@mips.com>
In-Reply-To: <20191012204326.2564623-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::32) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2601:646:8a00:9810:9d6:9cca:ff8c:efe0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4710ce72-da1c-448b-e247-08d74f8dcbeb
x-ms-traffictypediagnostic: MWHPR2201MB1295:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1295F0D2FDEA6176C995CEE9C1910@MWHPR2201MB1295.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01894AD3B8
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(396003)(346002)(39830400003)(366004)(189003)(199004)(186003)(44832011)(476003)(256004)(66556008)(64756008)(305945005)(99286004)(6436002)(76176011)(7696005)(52116002)(7736002)(66446008)(6862004)(25786009)(46003)(446003)(8676002)(4326008)(11346002)(486006)(42882007)(81166006)(81156014)(9686003)(66476007)(66946007)(71200400001)(6306002)(229853002)(8936002)(6116002)(2906002)(33656002)(52536014)(478600001)(71190400001)(55016002)(14454004)(316002)(6246003)(74316002)(102836004)(54906003)(966005)(6506007)(386003)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1295;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pbeLcQjEuPub5rqImHLibKUcODaZb7F7tTAFl6gZ7nWWqfYWjyPk8bV/WMYCUAw8oyd8qh6wXPRsMTiMzSv1W/mEuukXELp4Pa9/tc+ftmXEAHmrckxVvA9wxrVfz28JrdgtBH4QamhdKdTBiCJisT39jBmCbMfuHuh5s2VwBvZkORv0tKyH0cDeyvPProEKu29/hUgXCWbsqn/Z7TtezoJY/Br1IOKNSQzxJml01Q5A7zjgE7J34lcP5pt1i73GpPMUJAtdUKvd9xTeslVg7ABA23KYC2B9IQV0lyx05u3Kd0GAZIyc61gcwbJvVLBg6HCfWVPL5Et8nN7YzlZzyZ+pwJe0KV3jkbuUbTao++Fjc9rGbqbPDPzp61P8MEDFYZn50o5NVSGCl+tmoJJqR7fI9J5nRxDaHXEHeqdXwQNsiqiE+GdB69EGkhyJ3dydIGlia6/E6yepzeURTnQU6g==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4710ce72-da1c-448b-e247-08d74f8dcbeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2019 03:31:12.9799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KVki8Z32RhXN8tm3aStsDQEfDZa9UURjkYaX62tYrRUnyEKjde4OGIxypY9F6I8iWIAdR7sA5whEvchDCMsaNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1295
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> Commit 7784cac69735 ("MIPS: cmdline: Clean up boot_command_line
> initialization") made use of builtin_cmdline conditional upon plain C if
> statements rather than preprocessor #ifdef's. This caused build failures
> for configurations with CONFIG_CMDLINE_BOOL=3Dn where builtin_cmdline
> wasn't defined, for example:
>=20
>    arch/mips/kernel/setup.c: In function 'bootcmdline_init':
> >> arch/mips/kernel/setup.c:582:30: error: 'builtin_cmdline' undeclared
>     (first use in this function); did you mean 'builtin_driver'?
>       strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
>                                  ^~~~~~~~~~~~~~~
>                                  builtin_driver
>    arch/mips/kernel/setup.c:582:30: note: each undeclared identifier is
>     reported only once for each function it appears in
>=20
> Fix this by defining builtin_cmdline as an empty string in the affected
> configurations. All of the paths that use it should be optimized out
> anyway so the data itself gets optimized away too.

Series applied to mips-next.

> MIPS: Always define builtin_cmdline
>   commit b7340422cc16
>   https://git.kernel.org/mips/c/b7340422cc16
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>   Fixes: 7784cac69735 ("MIPS: cmdline: Clean up boot_command_line initial=
ization")
>   Reported-by: kbuild test robot <lkp@intel.com>
>   Reported-by: Nathan Chancellor <natechancellor@gmail.com>
>=20
> MIPS: Fix CONFIG_OF_EARLY_FLATTREE=3Dn builds
>   commit 972727766ee4
>   https://git.kernel.org/mips/c/972727766ee4
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>   Fixes: 7784cac69735 ("MIPS: cmdline: Clean up boot_command_line initial=
ization")
>   Reported-by: kbuild test robot <lkp@intel.com>
>=20
> MIPS: Make builtin_cmdline const & variable length
>   commit 9dd422f69777
>   https://git.kernel.org/mips/c/9dd422f69777
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
