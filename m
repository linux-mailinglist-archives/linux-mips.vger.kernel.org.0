Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A975B73E18
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jul 2019 22:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390101AbfGXUW2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jul 2019 16:22:28 -0400
Received: from mail-eopbgr820093.outbound.protection.outlook.com ([40.107.82.93]:22216
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388767AbfGXUW1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jul 2019 16:22:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkgW8p4JrZHVEniUQIset6a/T3tZc+Mevc9LpIn3IO5VLadL5iAGIwsE3zPhgS8Q6jMDU47sFhgSV1tFDiQWzZ0f1ImI56UYyjdF1rk6l6RSubbyeRWR+AiAhzJea86RvCMO3DL+pWXJyRRX/JLIRoS3kkbXraSYkV9lOXElL6BOYFPcZjSGOBwDEXUH6RuigzgAS6FjpZPLHuTbB11lIlfsBWQNxx47utccyswrYW6DzMq75VWhcaIPRtOsu6pGDnA82Ymd3j08dNOC2oGuM+atlygFQzKCo9BrkpLZpY/fEac5Dl0Amfe4jMWpffpuL7jAgBBi+4hQDxl/tmpZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1iZ65VED0sGN8C9wCFjTh2cJLntB8+Ur/yCBTaaI8Q=;
 b=fJcLJvBAVff1C6NGo3U1kkJhvBBqqlf+LxCgy7nGFygMC+yF0rFL5Ept7LrMQzcxIPJ1dW4Y5wJJYzpGDlnh+BHLv7ppvS2yeOOzmDXJ+QLgEXTBXbxakv+3lFeWRjLTeO7oHwgGo5/YvmzKYZgDYYmWP3psXfznvNynB9mEdKdiutvusLA6t1uMDiWrVobPXsENzYEraS9v9gc/vYew4yDxztnabtbjAKEL147RJzfG9b6LYj4FylDuMVDc5+zYPW6sQoOW5GLC+PSMf7Vs5lF/8BMDe8++bj/r7B/y0+ZHRlsEj7zLaO1qTN3xijSZF473sxBBEREVxus3lp2uGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1iZ65VED0sGN8C9wCFjTh2cJLntB8+Ur/yCBTaaI8Q=;
 b=LVP9SM7VAWVXgeAMpObFLCO+yoSSFGr+aahkPSXjPc/Stx38by28Zq+IbVbQN/WMX+43TaJWZL0fTgdE67brT09YMKP9wNsHVAbCmS/WmADyp5p/rwYkft9JYNai4C/ZF3EejFYRb4wuDbORrDV79nlOUkoS6JJKuZxTU36WdS0=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1136.namprd22.prod.outlook.com (10.174.171.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 20:22:24 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Wed, 24 Jul 2019
 20:22:24 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/4] MIPS: Remove unused R4300 CPU support
Thread-Topic: [PATCH 1/4] MIPS: Remove unused R4300 CPU support
Thread-Index: AQHVQNjE2OmJveifz0y924MF9xE0uqbaOU+A
Date:   Wed, 24 Jul 2019 20:22:24 +0000
Message-ID: <MWHPR2201MB1277E4C299835A5E1F37E091C1C60@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190722215705.20109-1-paul.burton@mips.com>
In-Reply-To: <20190722215705.20109-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::40) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06c9471b-5a63-4ed6-b2b0-08d71074a392
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1136;
x-ms-traffictypediagnostic: MWHPR2201MB1136:
x-microsoft-antispam-prvs: <MWHPR2201MB11368567DC207DB0D5EEFDE9C1C60@MWHPR2201MB1136.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(376002)(346002)(396003)(39840400004)(199004)(189003)(6246003)(76176011)(478600001)(256004)(52116002)(66066001)(66946007)(7696005)(5660300002)(64756008)(66476007)(66556008)(3846002)(316002)(66446008)(8676002)(4744005)(33656002)(6116002)(6862004)(74316002)(68736007)(4326008)(386003)(6506007)(71190400001)(71200400001)(305945005)(102836004)(26005)(6436002)(81156014)(7736002)(2906002)(9686003)(229853002)(55016002)(42882007)(54906003)(8936002)(53936002)(99286004)(446003)(11346002)(14454004)(44832011)(25786009)(186003)(476003)(486006)(52536014)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1136;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AeSHjEtBbMVR4BvNc4G0PvEe6S8Z8LI4EpL2ngqUt+5JjfAGlinoLYyvxS7gUIvBlragiqtrSLgO/NL91Uf+qGNh2Xsd4KV5yPsV0jq0jcelFSagqkK0IbrrRP1tSQL80RQI6Sv1ugSXcjNsE6/JNjX6V9UJYvWhKO/fEn5jj0ONevxPCrHMTu6ZgEPUBhdRuD9oQwXyutf422ZzHiXF/ND50VmJ+qDlAUv0kgrl7GSAMFd9DNzAO+hwfU8yTRRnUV8ojRsSI6IWCsl1HeTK/78rMbYmloU/AO+a3ficXkchS+J0laLb/cbCUUnVhwx0sCdNHWLLSPdnpLKxa9zh7h5CNel4rcWfDLxISc55oSUtBlXSTjkbvjsecYRD2tbjNdVQhlJWQDmFuWPEjJ9oBVeXJpiIWddRVKpWfwQtNCU=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c9471b-5a63-4ed6-b2b0-08d71074a392
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 20:22:24.5247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1136
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> Our R4300 CPU support can only be included if a system selects
> CONFIG_SYS_HAS_CPU_R4300. No system does, making all R4300-related CPU
> support dead code. Remove it.
>=20
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Series applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
