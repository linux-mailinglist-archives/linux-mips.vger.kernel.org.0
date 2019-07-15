Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9226C68818
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 13:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729756AbfGOLW5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 07:22:57 -0400
Received: from mail-eopbgr820108.outbound.protection.outlook.com ([40.107.82.108]:2209
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729725AbfGOLW5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Jul 2019 07:22:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPAEnmRV+dbPRFse/XnoJuqMC5tO5QAwBnD7t/cDMz+LmB+ZzZYRISagqg5dWW9nRU/A02+CsNptjkMfQGW3Y216fBCWULHcxigHQJBVfFpCfqk/vggF9F24yNKn7AyF3xKiWBrRKAC/nFOOvvW8Zb5WT/14X06h0Z9U/G0mRJhjHsa75re/8s+dT1aeyDNRSNxRJgZfke7zP0I8OTDTMJ8k24n1k2a4ltMfUy1K4gOOG8Yaqk4AZ0HSPJZUpGsaeTk00GZbS8Bkn3Cz9amD33ZIQ/NjPLln49MuIM8A6FJpsBBpL14tLITQf74UNs+cHQv0whRzuTX5ZDuKUxC6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8daD0eRpBqY5IVzrs0TzMVIyvmpLdU2ovRIGcJA/4BA=;
 b=a4wc3z6TAAI/EuMF/Y1srlrm/HVNi1aGzN81IoUpOSQQE+YH+bNBVAoOak4m3m/cO6/ymIprAT4aYPmb3YSIqRDL8TC8s4s5PGGZUsF/wNmcfxlh+TDy3q8EoXNglt6sZj4OCMX4SHejt1Ba+PH9BuelWzLKxungjbwqQKcBENOLcd9kXQ5jpFMUBLc3OmlKVbtaKUZiEJEx8yS63FkQYjN6X1G+/d8pIF9hv293C+WMMY95l2uKfPIdk96FD7Tb3Y9xPkOdvZtuzj/b1qmbCduY5V2XbVCFzJi7C9HYOF/Xxux4sggvPsl/jF4z1JMkK82F9uGFyy5Lg/9nhsqOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8daD0eRpBqY5IVzrs0TzMVIyvmpLdU2ovRIGcJA/4BA=;
 b=aQU0sE59COcnJtgygcATpAzpwTY7KsVZxW+yCLDxh/hw4baWlcg+LPSu8tVHBpHROQTn6HNfLqJMzcMLjd1SZL8wSVUP1Q0Ou5vW+oXE7gJ09+WoOgll+Ae8MWJ0yDRalywjsqaPpvPByFr7lux69fio8+kLORmqwZB62GPFNBY=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1261.namprd22.prod.outlook.com (10.172.60.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 11:22:53 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e%5]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 11:22:53 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: perf events: handle switch statement falling
 through  warnings
Thread-Topic: [PATCH] MIPS: perf events: handle switch statement falling
 through  warnings
Thread-Index: AQHVOv+kczWDxEXrFUGBgYR+rnlhhg==
Date:   Mon, 15 Jul 2019 11:22:53 +0000
Message-ID: <MWHPR2201MB12777D68602F497F2CE464D9C1CF0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190715201540.1e4bb96a@canb.auug.org.au>
In-Reply-To: <20190715201540.1e4bb96a@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CWLP265CA0096.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:50::36) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [188.30.202.102]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b74e15c-9ef7-4aca-5026-08d70916c72f
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1261;
x-ms-traffictypediagnostic: MWHPR2201MB1261:
x-microsoft-antispam-prvs: <MWHPR2201MB12610CBE9039A28CF5DCED1AC1CF0@MWHPR2201MB1261.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(396003)(136003)(39840400004)(366004)(189003)(199004)(478600001)(4326008)(44832011)(33656002)(66066001)(71190400001)(71200400001)(53936002)(68736007)(6246003)(52536014)(7416002)(7736002)(305945005)(2906002)(229853002)(256004)(8676002)(6916009)(74316002)(102836004)(14454004)(6116002)(3846002)(186003)(99286004)(55236004)(26005)(11346002)(54906003)(55016002)(476003)(9686003)(25786009)(81156014)(81166006)(486006)(64756008)(66556008)(66476007)(8936002)(66946007)(66446008)(52116002)(7696005)(42882007)(386003)(76176011)(6506007)(5660300002)(316002)(446003)(6436002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1261;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZnQpayfGlXrIsJL/BWXkoA/3P8l8ITCIrutbLr/B3B7xG4J7aaeZoFIqEBwPeUcFUlWr67MLTn+6x+wPCRpSVyBjePuodYNH/ASv2/PzeQKQIP1HQgr6zB4jxtx28W0II3H9DVHUl6u7fCcl02CzgOpL2Zutxuh/jVcXpkO5CkW9ytgcupeppO8eO04YORYCgjeRY+Nth3r3ZBA6sB4316f4pOaVpHEaSez/rEKsl9UhBPOJeI+nG0Ca3GcfuRZE58GwbIBj6G35b4YVMTp7ySXlM3ChbamcE7mDDj1I3lwFJEjX5clXdmjTnGTHysxFLHaFVvoBmSFN2j2q4J6BYmQFHyFJu3qleuBH7g1jvdj6ppQWCqq+SD1jc3/ADak964BqCV+luJL5lakFsqE31k+UNyqQpKCZVDFxs8BXbE8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b74e15c-9ef7-4aca-5026-08d70916c72f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 11:22:53.5254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1261
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Stephen Rothwell wrote:
> Now that we build with -Wimplicit-fallthrough=3D3, some warnings are
> produced in the arch/mips perf events code that are promoted to errors:
>=20
> arch/mips/kernel/perf_event_mipsxx.c:792:3: error: this statement may fal=
l through [-Werror=3Dimplicit-fallthrough=3D]
> arch/mips/kernel/perf_event_mipsxx.c:795:3: error: this statement may fal=
l through [-Werror=3Dimplicit-fallthrough=3D]
> arch/mips/kernel/perf_event_mipsxx.c:798:3: error: this statement may fal=
l through [-Werror=3Dimplicit-fallthrough=3D]
> arch/mips/kernel/perf_event_mipsxx.c:1407:6: error: this statement may fa=
ll through [-Werror=3Dimplicit-fallthrough=3D]
>=20
> Assume the fall throughs are deliberate amd annotate/eliminate them.
>=20
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
> Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> Cc: Jiri Olsa <jolsa@redhat.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied (with some tweaks) to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
