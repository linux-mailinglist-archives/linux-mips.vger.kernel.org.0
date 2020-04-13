Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4401D21EE
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 00:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731138AbgEMWXF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 18:23:05 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:61133 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730064AbgEMWXE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 18:23:04 -0400
IronPort-SDR: yexkrOKO2iVAoGW9XWov+YvxtjjcTsS1LeB3m3LJot+7lz4cPI2zCwdZuD2r6OyY6E5jzsxqQ3
 5P7R7CV9ZFcvByFge4O7DEihAiKPtRut5XoNIBGDgl07D8eNmW46bxC1vE0g3Lp0XOkF8ixCIg
 mSuAHgThNcijigkGX+cEHLtlhcCxAjGZesgjTwG6YdY4ycqH65oWUBLwSBt+VSBulXBt9gxEtH
 7OI2923CqMGC2EDC+I4ZHq/Ee50IuDBsZQ2hQW1aXsErw8dtY4Rv7TvS1r4HqpU3ShLV5UK0H7
 V68=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="137620224"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:23:03 +0800
IronPort-SDR: TLBvdpXwg970kmEm5osqnWHOc8GbtP97wOPC5cf73YYlRwFCfdNSp0896sbcC4B1sKKclqnijf
 ku1w3CpU//SzMJzPEIlpWLClfK/3R6L+E=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:13:16 -0700
IronPort-SDR: KYruNOjKLoQ8AwlGdQBr13ru8Y4GGC0ommx6movQJMP3nq4NTdhcJX6B8t+P0K+3OPWhe/yH94
 ouLRkQDBr57g==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:23:02 -0700
X-Received: from CY4PR04MB0374.namprd04.prod.outlook.com (2603:10b6:a03:117::45)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BYAPR08CA0068.NAMPRD08.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:19:15 +0000
X-Received: from BN6PR21CA0015.namprd21.prod.outlook.com (2603:10b6:404:8e::25)
 by CY4PR04MB0374.namprd04.prod.outlook.com (2603:10b6:903:bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Wed, 13 May
 2020 22:19:15 +0000
X-Received: from BN3NAM04FT036.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:404:8e:cafe::54) by BN6PR21CA0015.outlook.office365.com
 (2603:10b6:404:8e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.1 via Frontend
 Transport; Wed, 13 May 2020 22:19:14 +0000
Authentication-Results: spf=none (sender IP is 216.71.153.141)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa3.hgst.iphmx.com (216.71.153.141) by
 BN3NAM04FT036.mail.protection.outlook.com (10.152.93.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:19:14 +0000
Authentication-Results-Original: esa3.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: TZX4iXsRV8QJIgtAfarVTxH2vv9kSP1tJpaghLwdPiGWuory8XY2+OnBWh7JimM6+HldPIMQlG
 9/CWr25AHV40iQgYODTsNnYZ3RoxEYaWsLDtR2aDDteT28Vlbzk1IA1lJLeRpg5auN9byL2OWr
 h0ZzWJbP4OfoGi76BIoFZenj/kxAuXoQIZGKAYEQtCkQUuM+YqkbZtUS6HB7dCGLeag+VhNsb7
 cB7H00Ty76+lmNjrrKi0hptlSg3Rai1Gvz5n6A6NvF2LrzLY3a+VcT69PUp1gpujUdUyOcXw5U
 jtz1+nrcz915nNxrlGChcIMD
IronPort-PHdr: =?us-ascii?q?9a23=3ANq62KRxCPIbFP2LXCy+O+j09IxM/srCxBDY+r6?=
 =?us-ascii?q?Qd2ugSIJqq85mqBkHD//Il1AaPAdyGraMZwLKI+4nbGkU4qa6bt34DdJEeHz?=
 =?us-ascii?q?Qksu4x2zIaPcieFEfgJ+TrZSFpVO5LVVti4m3peRMNQJW2aFLduGC94iAPER?=
 =?us-ascii?q?vjKwV1Ov71GonPhMiryuy+4ZLebxhIiTanZb5/LBq6oRnQu8ILnYZsN6E9xw?=
 =?us-ascii?q?fTrHBVYepW32RoJVySnxb4+Mi9+YNo/jpTtfw86cNOSL32cKskQ7NWCjQmKH?=
 =?us-ascii?q?0169bwtRbfVwuP52ATXXsQnxFVHgXK9hD6XpP2sivnqupw3TSRMMPqQbwoXz?=
 =?us-ascii?q?mp8rxmQwH0higZKzE58XnXis1ug6JdvBKhvAF0z4rNbI2IKPZyYqbRcNUHTm?=
 =?us-ascii?q?RDQ8lRTTRMDI28YYUREuQOP+VWr4fyqFQStha+GRWgCP/zxjNUmnP6w6s32P?=
 =?us-ascii?q?khHwHc2wwgGsoDvHrTotrvKKgSUP66zKvVxjrDdf9dxCvz6I/JcxEhvf6MXr?=
 =?us-ascii?q?NwfcTMwkQoEgPKlEmfqZbiPz6O0uQNsm6b7/dvVO62jm4nqhlxoiO1yscrkI?=
 =?us-ascii?q?nJiZsYx1bZ/ip23Ig7P8e3SFJnYdG6CptQsTmXOpd4T84tTWxluSc3xL0HtJ?=
 =?us-ascii?q?C1fCUH1Jcqyh/dZvCafYaF7BPuWfuSLDp2hHxrd66yiRmu/EWkyuPxUtW43U?=
 =?us-ascii?q?pKoydDj9LCuHcN1xnJ5ciGTPtw5kOh1iuU1wzJ8eFLOlg4lbHcK5482L4/io?=
 =?us-ascii?q?QcsErZES/shkr6lqiWdl8r+uSw5OTnY6nmpp+BN4BvkA3xLqMumsm5DO8lMQ?=
 =?us-ascii?q?YOR3CW9fmz2bDg50H1XrVHguAsnqTdsJ3WP9kXq6C6DgJTz40t8QywDy2839?=
 =?us-ascii?q?QdhXQHLExKeBaAj4XxJ17OPuv4Ae27g1Stljdr2v/HMqTkApXMNnjDi63tfb?=
 =?us-ascii?q?Fn605T0AYzzNZf6IxICrwZPf7+VUz8uMbGAhI5LgC42eLqBdVn2o8DV2+CAb?=
 =?us-ascii?q?eVMKbIvl+J4uIvLfOMZIgQuDvlLvgq/eLhjWU+mVIGeamp3J0XaG23H/h/Jk?=
 =?us-ascii?q?WZYGLsgswbHWcNpAo+Q/TmiEeeXj5Le3ayQ6U86yk+CI28EYjDXIetjaeP3S?=
 =?us-ascii?q?imApJafHxJCleJESSgS4LRdf4KZziPI4dalToLHeykQpQizxi/nAD9zLVjI6?=
 =?us-ascii?q?zf/ShO5rz5090grcjanhA/93RLSYyn1HOcRGJ11CtcQjY9xqdXpU1710fG1K?=
 =?us-ascii?q?lgmLpfD9MFtKABaRszKZOJl78yMNv1QA+UO47REAz8EPy7HTE8SM4wyNYSYk?=
 =?us-ascii?q?F7Xu+vlQ3HwzHzXedHmqeCX9o0/bnAmXnpJ8NtjX3B0fppg1onR55JMmurzu?=
 =?us-ascii?q?56+hPIDoHE20Oei+6xdKsa0SKMvGeOxGaDpgdZBQh3V6iWFWsHaB7wqtL0rl?=
 =?us-ascii?q?jHU6foDL0mNgVbzsvXL6JBcNrBiVRAWeemPdXGeCS2gWjjTQ2QyOaqa4znM3?=
 =?us-ascii?q?4YwD2bCEUAlFUL+m2aMAElGiq7i2nAF3pqFFTycwbp8PFl7nShQRZunTuHZE?=
 =?us-ascii?q?Bgybe5vyUtq6bNEaE12bQJ8GcssDwvWlayxM6QCsKAohond6JZM5s75x9c2G?=
 =?us-ascii?q?TVuhY1N4G8L61kml8Vchhm2iGmnxRxBIJalME2rXQshANsIKOc2VlFenuWx5?=
 =?us-ascii?q?f1crHQL2Dz+lioZebT01rE1/6S+6ES+LE9qk34+gazGQtHkT0v0tVY1Wed+o?=
 =?us-ascii?q?SfCQMTVZzrVUNkvxN+przcfmw8/9aNiS0qa/Tt9G6fnYtyVLhAqF7oZdpUPa?=
 =?us-ascii?q?KaGRWnHtYTXI6uJ/c23VmxbhcUeutV8f1RXYvuev2Y1aqsJOslkiihiDEN5Y?=
 =?us-ascii?q?l2yEWk8yt6V/6N2pcd2LefxATNBFKexB+x99v6n4xJf2RYG2O00y/MAI9Xe7?=
 =?us-ascii?q?03eIcTEiGpOcL9lZ1uwpXqXXBf7luqAVgLjdSxdy2VaVjshFcC70kcrH25lC?=
 =?us-ascii?q?f99ARayGl4/IyY2iGGg+n5fUFBOmFQWC9jlVfpMc6/iNVIFE6vJxMkkheo/w?=
 =?us-ascii?q?7z2rRbqaJjLmLSXVYtHWC+LmdsVbG1v6aDZMgH4Y0hsCFeWuCxKV6ATbu1rx?=
 =?us-ascii?q?wf2iLlV2xQoVJzPymtoYn8lgdmhXi1J2ho6n7Yf9xggBLe/MeaQuRen3IHSC?=
 =?us-ascii?q?R+lTjLFw28Mt2urrD239/ItuGzUX7kV4UGKHW7i9nd7W3quCszWk3s1+q+kd?=
 =?us-ascii?q?DmDwUghCLg3oIsVSrTsFD9eonux+KxNuc0GysgTFL69cd+HZlz14Uqg5RFk3?=
 =?us-ascii?q?0TjY+S1X4Gl3rjdNBawbm4a2ACD21uoZad8E3+1UtvI2jcjZr+TWmYy9B9as?=
 =?us-ascii?q?OSaX0NnCY86d1aTaKV9KcCmjF66Andz0qZcb12mTETzuEr4XgRjrQSoAQayS?=
 =?us-ascii?q?OZE+lDT3kdBjTlklGz1/77qaxWYGi1dr3pihh6nNa8HPSHoxlHHnHjdcV6RH?=
 =?us-ascii?q?Ii3oBEKFvJlUbLxMTkdd3XN4pBvQOP1RPBifVFbZcwjuFMgjBoazrw?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0EUBADGcbxefYpf+5RmHgEBCxIMQIE?=
 =?us-ascii?q?8C4IldlAlAwQLLI0mh1+bSTwPATEKBAEBAoRCAoIrBjkGDgIDAQEBAwIFAQE?=
 =?us-ascii?q?BBAEBAQIBAQEDAgEBAQECEAEBFjo0YFOBR4FBLAkGAwEvDII7KQERXn4BAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBAQEBAQEBAQEBARICDVRpAgEDEig/EAsOOFcGNYMFglclD6Q?=
 =?us-ascii?q?jAYEoPgIjAT8BDIEFiX6BNIROQYVbBoE4jBw6BoFBP4ERMwOCLC4+gk4ZAgE?=
 =?us-ascii?q?Bh1cEkRkBoWQHA4JNiB2QFx2dSZoLlWkigUQNB30IgyRNAQIBAgEMAQICAQE?=
 =?us-ascii?q?BAgEBCAEBAQGUL4UUhUNDMDcCBggBAQMJj0QBAQ?=
X-IPAS-Result: =?us-ascii?q?A0EUBADGcbxefYpf+5RmHgEBCxIMQIE8C4IldlAlAwQLL?=
 =?us-ascii?q?I0mh1+bSTwPATEKBAEBAoRCAoIrBjkGDgIDAQEBAwIFAQEBBAEBAQIBAQEDA?=
 =?us-ascii?q?gEBAQECEAEBFjo0YFOBR4FBLAkGAwEvDII7KQERXn4BAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBARICDVRpAgEDEig/EAsOOFcGNYMFglclD6QjAYEoPgIjAT8BD?=
 =?us-ascii?q?IEFiX6BNIROQYVbBoE4jBw6BoFBP4ERMwOCLC4+gk4ZAgEBh1cEkRkBoWQHA?=
 =?us-ascii?q?4JNiB2QFx2dSZoLlWkigUQNB30IgyRNAQIBAgEMAQICAQEBAgEBCAEBAQGUL?=
 =?us-ascii?q?4UUhUNDMDcCBggBAQMJj0QBAQ?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="141966952"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa3.hgst.iphmx.com with ESMTP; 14 May 2020 06:19:13 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23991633AbgEMWTL00TsP (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:19:11 +0200
Date:   Mon, 13 Apr 2020 21:08:46 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Fangrui Song <maskray@google.com>
cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Borislav Petkov <bp@suse.de>,
        Kees Cook <keescook@chromium.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] MIPS: Truncate link address into 32bit for 32bit
 kernel
In-Reply-To: <20200413153453.zi4jvu3c4ul23e23@google.com>
Message-ID: <alpine.LFD.2.21.2004132107550.851719@eddie.linux-mips.org>
References: <20200413062651.3992652-1-jiaxun.yang@flygoat.com> <alpine.LFD.2.21.2004130736410.851719@eddie.linux-mips.org> <20200413153205.4ee52239@flygoat-x1e> <20200413153453.zi4jvu3c4ul23e23@google.com>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:19:07 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH v4] MIPS: Truncate link address into 32bit for
 32bit kernel
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132319070.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:19:14.3540
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: d55ca279-a0d5-4aa6-243d-08d7f78bab5a
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.153.141;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa3.hgst.iphmx.com;PTR:esa3.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(34756004)(7636003)(8676002)(42186006)(1096003)(107886003)(26005)(5660300002)(6666004)(86362001)(966005)(7596003)(8936002)(33440700001)(54906003)(4326008)(336012)(6862004)(356005)(82310400002)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: BN3NAM04FT036.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: d55ca279-a0d5-4aa6-243d-08d7f78bab5a
X-MS-TrafficTypeDiagnostic: CY4PR04MB0374:
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:19:14.0842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d55ca279-a0d5-4aa6-243d-08d7f78bab5a
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.153.141];Helo=[esa3.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0374
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.8162536
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0o0bCTELxBkISYuiTZX9t8b0x0kaYx0/h32EmG8ZfUn7aEyWX3+hxpRRh3uS?=
 =?us-ascii?Q?hqXoEQcw/aBndAvtItXOH59kM0bRCx3Naxzwn6q6uzHUYXUvkCJqOifXxUXB?=
 =?us-ascii?Q?qwVFXYVkMH4qiwm1Sn4TsoRvy9J4yIYFnEEzQrfI+JyzOLhukeKC4309O8T7?=
 =?us-ascii?Q?rB0cElPiZo0ixOArLZprjebe4ShxtChuNPE8nxf+IW5aVCJbf3Hd7jWWA4Ya?=
 =?us-ascii?Q?OTROgpuzrlUvoVx9o7U1ZWOr8IG5BYxnxtrJOMFBVTL4jTOkAj8c6gSFgmVS?=
 =?us-ascii?Q?xRT0mR22C1pwAAYmiXh+VoJ/9SGx5ONosfDwKSEd7ZOht4ZXHEnMmeguOa1B?=
 =?us-ascii?Q?zccq/YQhNW3Oc9f+m37CCkEZmG4ynWhJsTG/neKJ7L3E0GBxkXHN46BIc/DM?=
 =?us-ascii?Q?ew76xSp0mS9Ds+vuO8wglFsKenk4PzU7xKHtLF/UlhnbTElpXso+ZuQlVubF?=
 =?us-ascii?Q?NnZQgfX/EjoZNQYRTn69IpBp40y29mDMesjxNfDxz973T97ZkZjrsthOvp56?=
 =?us-ascii?Q?bpno1z6D1c3Kq/wO7CxApYSGCSDsnA4VQia14E7zcCXeWGMoktHEOpbR8PDS?=
 =?us-ascii?Q?ePNJFJv+pyv3wts3HnIPunCkXHf2AHqR1E4pvXAhQQpAuVH1iOROo8fBHEmS?=
 =?us-ascii?Q?6Asm91sr0tt9DJMYYsXrOcEmHXhEW/cQV3NIHTjs6hGmcknSKNpqWXD8kk9j?=
 =?us-ascii?Q?ZUbwJkCGIr+0+QTcJM8Mel2qrONP3wjJuzbMPgwnC9grkyZ2FDzfhEvzYuMk?=
 =?us-ascii?Q?sYAiQKjOD/JyRO2oKGalMG86gI1Pptcr8v2ddcy3iPw+AoBV4Q8Heq/G/UAq?=
 =?us-ascii?Q?Grv2SnVER/TujpxKCnQfOVl0LUNRRzricQl+R3qu/cZdidZm/88C1HQozjER?=
 =?us-ascii?Q?KVvjZ33NSlQqgRGkHzAmo2bZ2eC7dA/fqhD2Y9L7wN50NsyW0zu3N0pVzZ7a?=
 =?us-ascii?Q?76NO2yDtKAD3EoCcFp+66/wPW4A0Uud7m8UDA2oLdrdkeL5613E1iJJBv2ry?=
 =?us-ascii?Q?WxoPoDYkH13fMgDVDz2BvJdjmpBrJzmkdlxdeEk1a4K39YEqyHRS5moA3L4X?=
 =?us-ascii?Q?EXRV6Fkex9XLhEthjp0M7VKJQ4qtO2fE0vo56UFQdoDOwHoiqK+oaf3kXNo0?=
 =?us-ascii?Q?rkAD5v/fuEVvFme22qJQIPD/Tu6rvht18dmUZqOZMr7YyfK8iywLEJDSXq9g?=
 =?us-ascii?Q?YyukfnNsYYfA3Ob08UJ1eEucTF29gj5ptVGFKebKnyeQa/ZgwWUOi4cTg0+Y?=
 =?us-ascii?Q?SAjMvRFQgkHwdunh+V2b8nI0MLoxD6h0pSM1AugS9rxrgrCGgYDqllV9z/0t?=
 =?us-ascii?Q?+A/AqeBpJEZigDr0Marp2hUG9DLthT0FfXV0yJy+uAguPJF6JswkBUYpQ+FW?=
 =?us-ascii?Q?jq8T/Jxc+Z/LmEDFV+We+TEkk+d06XyHc9RoLRZSiLCA4lPyct7XwJ8gr4v7?=
 =?us-ascii?Q?+QP15LOlXAWNDiLyiCyfmvkufNCPAkH/?=
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 13 Apr 2020, Fangrui Song wrote:

> >> > diff --git a/arch/mips/kernel/vmlinux.lds.S
> >> > b/arch/mips/kernel/vmlinux.lds.S index a5f00ec73ea6..5226cd8e4bee
> >> > 100644 --- a/arch/mips/kernel/vmlinux.lds.S
> >> > +++ b/arch/mips/kernel/vmlinux.lds.S
> >> > @@ -55,7 +55,7 @@ SECTIONS
> >> >   /* . = 0xa800000000300000; */
> >> >   . = 0xffffffff80300000;
> >> > #endif
> >> > -	. = VMLINUX_LOAD_ADDRESS;
> >> > +	. = VMLINUX_LINK_ADDRESS;
> >>
> >> The CONFIG_BOOT_ELF64 cruft right above it looks interesting to me,
> >> never have ever been used.  We have had the current arrangement since:
> >
> >It confused me either.
> >It's only used by SGI so probably it's time to rename it as
> >BOOT_SEG_ELF64.
> >
> >Wish someone could clarify what is it.
> >
> >Thanks.
> 
> Agreed that -Ttext in
> 
> arch/mips/boot/compressed/Makefile
> 100:      cmd_zld = $(LD) $(KBUILD_LDFLAGS) -Ttext $(VMLINUZ_LOAD_ADDRESS) -T
> $< $(vmlinuzobjs-y) -o $@
> 
> and a few other places are brittle. They need to be replaced with Output
> Section Address:
> (https://sourceware.org/binutils/docs/ld/Output-Section-Address.html
> https://github.com/llvm/llvm-project/blob/master/lld/docs/ELF/linker_script.rst#output-section-address)
> 
> -Ttext changes the address of .text . This can lead to the change of the
> address of the text segment (RX), but this is not guaranteed (many
> sections can be placed before .text and they are not affected).

 That is unrelated, but you're free to clean it up of course.

  Maciej


