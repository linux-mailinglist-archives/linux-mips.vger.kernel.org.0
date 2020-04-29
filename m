Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E691D222F
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 00:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbgEMWlE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 18:41:04 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:21203 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgEMWlD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 18:41:03 -0400
IronPort-SDR: U8bB6bp808A13XqxTEWXGiU0Lrx5JoTejf9aZ61ed3UH5MBJsvhg/kXmlyRQ8AQJ6ZNWFsVt7C
 YlYSO8Nagk3W32kdRvUpd6Ow9lW5XLtUxPB6WMg7IY2qdKS1G0iPr8AsS43Ugw6qb9jxMTgbJ7
 IgZg+yneneOCb5yVeg01hrNHjJBtl/Az7G3t83u9uwTKhqzm7U79nU1Rk51KBJcJ4MCR6viCx7
 ji9x7gPF+sGtlDDZfjCiX/ShvIeIVVPHnsdJEaWD0PKUkgoluLXX3OCc2cnf1Y0Yb6HOR+PI8c
 1XE=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="141968735"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 06:41:02 +0800
IronPort-SDR: ce557ZdlOPH5MmdEvNJt8NdAWbsUdugj9A850LBdo06kraeQlOhgmT8hvKDMx02zBEacqdNU2l
 Cjw8lFtf5PuFqPJ60nk2TfpGgHtTcZRFw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:31:15 -0700
IronPort-SDR: vAiUWvUs9vVZ/j/batYQqDhdiDWEmsng2dkNRXLFUH+mznKr0kpr2Y2rbzELT3Mhda/8js08hm
 wU/d02Qh/AOw==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 15:41:01 -0700
X-Received: from BYAPR04MB5605.namprd04.prod.outlook.com (2603:10b6:a02:ee::25)
 by BYAPR04MB5176.namprd04.prod.outlook.com with HTTPS via
 BYAPR02CA0012.NAMPRD02.PROD.OUTLOOK.COM; Wed, 13 May 2020 22:34:06 +0000
X-Received: from BN8PR15CA0009.namprd15.prod.outlook.com (2603:10b6:408:c0::22)
 by BYAPR04MB5605.namprd04.prod.outlook.com (2603:10b6:a03:112::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Wed, 13 May
 2020 22:34:04 +0000
X-Received: from BN3NAM04FT037.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::4a) by BN8PR15CA0009.outlook.office365.com
 (2603:10b6:408:c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Wed, 13 May 2020 22:34:04 +0000
Authentication-Results: spf=none (sender IP is 216.71.153.141)
 smtp.mailfrom=linux-mips.org; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=linux-mips.org;
X-Received: from esa3.hgst.iphmx.com (216.71.153.141) by
 BN3NAM04FT037.mail.protection.outlook.com (10.152.92.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 22:34:03 +0000
Authentication-Results-Original: esa3.hgst.iphmx.com; dkim=none (message not
 signed) header.i=none; spf=None smtp.mailfrom=macro@linux-mips.org; spf=None
 smtp.helo=postmaster@cvs.linux-mips.org
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: sKu4twDulSrlIbgQ/hdog28F5mXQPROEnSUMtzN1zupXmrD4UdjvQrGOkg94ATfhnPnjolqApY
 cotii0/JUjjD3a/ISmMH9IMx/zNa1V1qPojFZPluEVT0iOyhF/Qb7bCFvVMRW4B+DJ5+/Y5Etf
 AZjtHC6ACKpqecsIiKkrcp4sYIxa9gsZLIR5u9MrzuhzNTLKlnwqo3mwyFZSLb2TnnFUYpKyeV
 bkqB3FNF4uLT2i31mlpc/uhqQkhP9a+rx5ekez4XJk5NQbUa5bITX3W8/5LwR6r2rlckLL/DvM
 l7Uyf3Wc1hww39+fXKgoO8vT
IronPort-PHdr: =?us-ascii?q?9a23=3ASPb4KhQtobIop9MoTS1lviL5R9psv+yvbD5Q0Y?=
 =?us-ascii?q?Iujvd0So/mwa6yYReN2/xhgRfzUJnB7Loc0qyK6v2mCDFLucfJmUtBWaQEbw?=
 =?us-ascii?q?UCh8QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFR?=
 =?us-ascii?q?rlKAV6OPn+FJLMgMSrzeCy/IDYbxlViDanbr5+MRW7oR/Vu8QWjoduNqI8wQ?=
 =?us-ascii?q?bVr3VVfOhb2XlmLk+JkRbm4cew8p9j8yBOtP8k6sVNT6b0cbkmQLJBFDgpPH?=
 =?us-ascii?q?w768PttRnYUAuA/WAcXXkMkhpJGAfK8hf3VYrsvyTgt+p93C6aPdDqTb0xRD?=
 =?us-ascii?q?+v4btnRAPuhSwaLDMy7n3ZhdJsg6JauBKhpgJww4jIYIGOKfFyerrRcc4GSW?=
 =?us-ascii?q?ZdW8pcUTFKDIGhYIsVF+cPM+ZWoZfgqVQMrhW+CwajC//0xz9UmnP6wbE23/?=
 =?us-ascii?q?g9HQ3Y2gErAtIAsG7TrNXwLKoeX+e7w7PUwjXCcfxW2yr254jSfhs8vf+MWr?=
 =?us-ascii?q?NxcMrNxkksFgPJgEibpIvgPzyPyusNqW+b4vFkVeKujW4ntg5wriGqxsctko?=
 =?us-ascii?q?nJnZgZylfe9SV22Ys4I8CzR0Fnb9C+CpRQqz2aOJVsQsMkW2xluCU3x74FtJ?=
 =?us-ascii?q?C0fSUHzIoqygPCZ/GZcIWG4gzuWeaNLDpkmn5pZa+zihiu/ES+1+DyWMa53V?=
 =?us-ascii?q?dEoyZYktfBtW0B2hrO4caEUvtw5lqt1DmM2gzJ9O1JIV04mbDfJpMh2LI8i5?=
 =?us-ascii?q?QevEfFEyTrgkv5lrWWeV8h+uWw6+TofLHmppiEOoBolAH+Kb4imsi+AeQ+Lw?=
 =?us-ascii?q?gPUHGX+eG91L375k31WrJKjuc5kqXBsZDaI9oUprKhDgNI3Ysu6AyzAymm3d?=
 =?us-ascii?q?gFh3UKKFJIdAiag4XnOFzCOPX4Au2+g1Sonjdr3ffGPrj5D5XINHfMjK3hfb?=
 =?us-ascii?q?Fm5k5YyQozy81f5p1NBrEEIfLzQlTxuMbfDh8jPAy42/znB8ll1oMCRWKPBb?=
 =?us-ascii?q?eUMKbIvlCU/OIvJPKBZYEItznhMfQq+/nujXpq0WMaKI+gwZsebjiTHv1gKE?=
 =?us-ascii?q?idZX32yoMHGHsHtQo3SufnjFmFSxZcYn+zW+Q34TRtW6y8CoKWDKWki72M3m?=
 =?us-ascii?q?+EWNVsYXJXAVONWz+8coyPQfAkbCOUP98klz0cTv6mUYB3hkLmjxPz17cydr?=
 =?us-ascii?q?mcwSYfr5+2kYEtv7eJxzgv6Tx5Cdic2GiRTmZy21kFXCIywLsm/xQvx0yKiu?=
 =?us-ascii?q?54jOdEU91L5/ZZFAw9MM2Uw+97DoX0XQTMNpeMRU29S9qrSTc2UpoqwtAIbk?=
 =?us-ascii?q?o8U9WvhxzOxWyrVrkSkbHYTIcs/Pf62H78b914126A0aAgi1c8Rc4aMGStnK?=
 =?us-ascii?q?lX8wnVGp6MlkSBjOCtb6tPlDXV+jKlymyD9FpdTBY2UajBWiUHYVDKqN3i+k?=
 =?us-ascii?q?7YZ7SwEvIjMw1c2YuHK7NRLNrzggwcFs3uM9nffW+93lyIK0zZnOGqa4znMy?=
 =?us-ascii?q?UQxyyGTkgLiBxV/G6GMBh4DSCk8SrYC3R1GFTjblmk+PRiqH69Uk4/zh2bCi?=
 =?us-ascii?q?8pn7uz9BkPgPWASvQVlrsasSYloj9wER6zxdXTQ9aHogNgeu1bb5s46Vxd0k?=
 =?us-ascii?q?rdtgpgLtmlLrh5wFkEfEUS3Qum1hl6DJlBjdl/qXoryARoLqfLmFhFdj6ewd?=
 =?us-ascii?q?XxIuiOdjm0pk32Lf+LnAiFgIXzmO9H8vkzplT9sRv8G1ErqDNn3MJJlXqE5p?=
 =?us-ascii?q?DaSgEVVMGUMA5/+h5kqrXdeiR46ZnT0CgmNKC/qDjq39MvGftgzxe4ZJFYKq?=
 =?us-ascii?q?zOR2qQW4UKQtOjLuAngQ3jaxsPJud68K8yItPjcvqew+isJukqz3q2yG9A5o?=
 =?us-ascii?q?56yEeF8SFxH/XQ0aECxfWJh1HVbTr3gVa/v8yyorhqPmlDTEy4zyWsRINKb/?=
 =?us-ascii?q?Y0fYkQFSGvO82y1pN1gJu/E3hfvEWuAV8LwoegZAaSYlrh3AZRyVVywzTvmC?=
 =?us-ascii?q?22yCZxmi0oqazX1TLHwuDrfh4KcmBRQ2wqgVDpKImyx9cUOSrgJxAujweg7F?=
 =?us-ascii?q?3myrJzr7pkaW3SR1pYOi33N3okVbG/9/KDb8NJ9JI0oHBXXeC7MjX4Avb2px?=
 =?us-ascii?q?oX1T+mHnMLnWxrMWv349Oowloj0zLOZGx+p3fYZ8xqkBrE7YeaRfFKwnwHXC?=
 =?us-ascii?q?l9mX/cAV3vWrvhtdiSiZrHtfizEmy7UZgGOyzixpmHnC+643B6RBi+h+v1nc?=
 =?us-ascii?q?foW1tfs2ezx5xxWCPEoQypKJHszLi/OPl7c1NAD0Hnrc57HJxu144xnIpW3m?=
 =?us-ascii?q?IVzMbwnzJPgSL4NtNV3rj7ZXwGSGsQ29Di5w7hyRQ+fELM/JrwUzCm+uUkZ9?=
 =?us-ascii?q?S+ZTlOiCkj9IZOCaGJ/PlBnDNu5F2iolCJOKkvrnIm0fIrrUUiraQMsQspwD?=
 =?us-ascii?q?+aB+lMT01ZOzH80hGJ98v4q79YNj6i?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0EQBABDdbxefYpf+5RmHgEBCxIMQIN?=
 =?us-ascii?q?sgWsDBAuNUodfJZtgDwE7BAEBhEQCgisGOhMCAwEBAQMCBQEBAQQBAQECAQE?=
 =?us-ascii?q?BAwIBAQEBAhABARY6NGBTgUeBQSwJBgMBO4I7KQGDYgEBAQIBEig/EAsOOFc?=
 =?us-ascii?q?GNYVcBSCkJgGBKD4CIwE/AQyBBYl+gTSKc4E4jFYGgUE/gREzA4JaPopCBJE?=
 =?us-ascii?q?ZoWUHA4JNmDQdnUmvdSGBWH0IgyVMAQIBAgEMAQICAQEBAgEBCAEBAQGfBkN?=
 =?us-ascii?q?nAgYIAQEDCY9EAQE?=
X-IPAS-Result: =?us-ascii?q?A0EQBABDdbxefYpf+5RmHgEBCxIMQINsgWsDBAuNUodfJ?=
 =?us-ascii?q?ZtgDwE7BAEBhEQCgisGOhMCAwEBAQMCBQEBAQQBAQECAQEBAwIBAQEBAhABA?=
 =?us-ascii?q?RY6NGBTgUeBQSwJBgMBO4I7KQGDYgEBAQIBEig/EAsOOFcGNYVcBSCkJgGBK?=
 =?us-ascii?q?D4CIwE/AQyBBYl+gTSKc4E4jFYGgUE/gREzA4JaPopCBJEZoWUHA4JNmDQdn?=
 =?us-ascii?q?UmvdSGBWH0IgyVMAQIBAgEMAQICAQEBAgEBCAEBAQGfBkNnAgYIAQEDCY9EA?=
 =?us-ascii?q?QE?=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; 
   d="scan'208";a="141968380"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Received: from eddie.linux-mips.org (HELO cvs.linux-mips.org) ([148.251.95.138])
  by esa3.hgst.iphmx.com with ESMTP; 14 May 2020 06:34:02 +0800
X-Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994954AbgEMWd4zbkTh (ORCPT <rfc822;macro@wdc.com>);
        Thu, 14 May 2020 00:33:56 +0200
Date:   Wed, 29 Apr 2020 18:46:33 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
In-Reply-To: <20200427232406.GA8226@ubuntu-s3-xlarge-x86>
Message-ID: <alpine.LFD.2.21.2004291835400.851719@eddie.linux-mips.org>
References: <20200419202128.20571-1-natechancellor@gmail.com> <20200423171807.29713-1-natechancellor@gmail.com> <20200423171807.29713-3-natechancellor@gmail.com> <20200426162737.GA9322@alpha.franken.de> <20200427020830.GA260@Ryzen-7-3700X.localdomain>
 <alpine.LFD.2.21.2004271712130.851719@eddie.linux-mips.org> <20200427232406.GA8226@ubuntu-s3-xlarge-x86>
Content-Type: text/plain; charset=US-ASCII
X-ReSent-Date: Wed, 13 May 2020 23:33:56 +0100 (BST)
X-Resent-Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-From: "Maciej W. Rozycki" <macro@linux-mips.org>
X-ReSent-To: "Maciej W. Rozycki" <macro@wdc.com>
X-ReSent-Subject: Re: [PATCH v3 3/4] MIPS: VDSO: Use $(LD) instead of $(CC) to
 link VDSO
X-ReSent-Message-ID: <alpine.LFD.2.21.2005132333562.1120869@eddie.linux-mips.org>
X-Return-Path: macro@linux-mips.org
X-MS-Exchange-Organization-ExpirationStartTime: 13 May 2020 22:34:03.7897
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 2a92fd8c-b112-4064-41ae-08d7f78dbd7f
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:216.71.153.141;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:esa3.hgst.iphmx.com;PTR:esa3.hgst.iphmx.com;CAT:NONE;SFTY:;SFS:(4636009)(33430700002)(1096003)(33440700001)(34756004)(4326008)(107886003)(5660300002)(6862004)(7596003)(8676002)(86362001)(8936002)(4744005)(7636003)(54906003)(356005)(26005)(42186006)(336012)(6666004)(82310400002)(1736002);DIR:INB;SFP:;
X-MS-PublicTrafficType: Email
X-MS-Exchange-Organization-AuthSource: BN3NAM04FT037.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: sharedspace.onmicrosoft.com
X-MS-Office365-Filtering-Correlation-Id: 2a92fd8c-b112-4064-41ae-08d7f78dbd7f
X-MS-TrafficTypeDiagnostic: BYAPR04MB5605:
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 22:34:03.5218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a92fd8c-b112-4064-41ae-08d7f78dbd7f
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=b61c8803-16f3-4c35-9b17-6f65f441df86;Ip=[216.71.153.141];Helo=[esa3.hgst.iphmx.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5605
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.8269967
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2979.027
X-Microsoft-Antispam-Mailbox-Delivery: ucf:1;jmr:0;auth:0;dest:C;OFR:CustomRules;ENG:(20160514016)(750127)(520002050)(944506383)(944626516);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q7LOH1wcGlF90mwxsrxRdspC35mHGgs8RCdEmqNpX3uHVYT8hC+Z9xFCghBy?=
 =?us-ascii?Q?0tahQNHbhBxJaIpJZkxzC0aGQpp8bmcsbXoTSFLZqkQgmZnDq0AEbpnc7L0Z?=
 =?us-ascii?Q?3b6jZKBlF/mJBZQgzgo8C++9g6S29DYS8irqiuOGNEeBNWupBdjxiEl+nABl?=
 =?us-ascii?Q?MKHs1wx4Aj6fUs8SFB6ImfctqGhqtVcR9tb4lSgs4f+CAkQ4afI5uxA/qgyH?=
 =?us-ascii?Q?2Lnduy6rTiT6W0thBvjjv5ItB/bO3hDHnxYeDN/P7QnstbfIXy6GU3RSo7Oe?=
 =?us-ascii?Q?ir1OjcPJxqkDlwqY6qq/SSONeBFqr5ZuQpQM50foeeLq53JuUDrchhSUng+k?=
 =?us-ascii?Q?76/kqnIdO6XjT5SfP/JIwS8khk8MkF9oSBm0hWv3YcXZXdBOlp/4fWEVywfG?=
 =?us-ascii?Q?NVtqc0shoc4vvsRZtKR1kojETan3/Z5DuKa38Ao7U023zuTxrqJHzeUkJraA?=
 =?us-ascii?Q?i02st0dHlE9aOq+64gLlS4F0VHKiOnyue15n8s2dZW7c4t99dz6D8c9IwgLM?=
 =?us-ascii?Q?9pYsxlS2hP5p/uk32Hb+0dwnGXsUvDJK1hyaYVLvCkDUwp9bzppt+LaL3Sss?=
 =?us-ascii?Q?BDWt4jKiAa0phbVnpZiE38jylwek05nwHV6ONpUxZzt48DmESr+JJlE2Xdtj?=
 =?us-ascii?Q?5tGx+sHNdli1Uoi9jUn8W4oQkTmMFN5KI9eGc1BcFLkqf6JkvMOPATe/Man2?=
 =?us-ascii?Q?aYynYU/thRW+Wndt25GRqNaG5BpyyfHZPxuI80rqdMgTAX7pbSkaLyhyClZ3?=
 =?us-ascii?Q?MeWYvNf7lUNaSACfmNrOKRtui3kLug9l53YOEUy6kVP7acNrIF1sOuy4Xuhf?=
 =?us-ascii?Q?aFFjF/mPAeDcXxWAcBgyMbz0jqn5I56/4dePaRp2TDBygmOzQPcs17dbZraQ?=
 =?us-ascii?Q?IHVT+REZFlG8tQriv9spi/A8pU5eqfTq9r+nrF4HTu6UVewDtrZ/JYXUNKc1?=
 =?us-ascii?Q?flUGctgFp/JKOZR5ku3VZ9WbYXaHDGtK1cEGJ/sSnkH391zZ/KWlA+0CdLus?=
 =?us-ascii?Q?uojjBCJJZ2fmYQ8jrwtm5CdtgjNN/7odtBRuxxFaCDHgbUAsZadTMn936GIc?=
 =?us-ascii?Q?HbERy+24GHQzi6xCQye1W9+SkfNui8i8HVKbMHHnf+oBS0xlbc8pItW9tcMI?=
 =?us-ascii?Q?q1YyxHC+o3MePZLxkzgWd65uRkSgB672VS5sXO9lq8xJlWEIdhlp1Ns5Y/mH?=
 =?us-ascii?Q?2TYh93IF/c8Tu6NPo/s5LpzWs9irMxRQP8dD2OJt1ByEEZ/l2/hN7oSGBuDD?=
 =?us-ascii?Q?kH52bTqR009IdUzfNYnVQ+mztjW/9i6Q8gsZu4iP2n6Tl5fX49Ayx69lYBBG?=
 =?us-ascii?Q?qxScUU7fxQw4rab9q8R3mfTTZEyw97cqOb7Q0cYQhTV7LSEkuoTYMg2BFJ+1?=
 =?us-ascii?Q?3IaQoYg=3D?=
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 27 Apr 2020, Nathan Chancellor wrote:

> >  Can you actually record in the change description what the difference in 
> > the relevant link command is, as shown where `V=1' has been used with 
> > `make' invocation?
> 
> That will be rather unweildy to put in the commit message since
> currently, $(CC) + $(KBUILD_CFLAGS) is being used but I can if it is
> really desired. Otherwise, I can just put it where I put the changelog.

 Umm, is the difference so huge?  I think a note along the lines of:

"[...] This change adds/removes[*]:

<part of the command affected>

from the invocation of [...], which is required for [...]"

-- only quoting what's actually changed will be sufficient.  Reword as 
required.  Otherwise it's hard to guess now what the change actually does, 
and it will be even harder for someone who comes across it and tries to 
understand it the future, when the context might be hard to reproduce.

[*] Delete as appropriate.

  Maciej


