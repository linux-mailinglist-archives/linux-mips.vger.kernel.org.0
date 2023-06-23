Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8388673C4C3
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jun 2023 01:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjFWXYm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Jun 2023 19:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbjFWXYl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 23 Jun 2023 19:24:41 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DF62685;
        Fri, 23 Jun 2023 16:24:36 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35NLfaP1030923;
        Fri, 23 Jun 2023 16:24:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=QMPF/tX/08OoXYYgDHIyBoI+lS+pddTJuje4or1ZJ6o=;
 b=ajM3gaFu9fcz+DmY4hgJaXYxpk5Hk5H4ILAWl5eDyGgm2HezfcjXG3Z+KUZLbf5tOjYp
 eIsdsSYJ5ireKA0mC03ZH4Oq2mjP1TW858e62CQoX+2HmlPiYPey64UnzBNSh+Qgmsso
 u5YM+oBGnfRkfV/TMauJ9sAsgPaBJLkXoLdvIYMFh3mL/UBmm7iv7eoxd/UIjRMEYj7e
 CqtV0QidHFniyHFLOyoc8Ro7uKBaYKK+9N190WMMbDkxhhP5AqJMHTO9C0qj+xcYw29h
 KM4vzf21Ejsz9pPWRgUqhM/4+8pJH6Pys5KEUM8tyUVhYzJ5bj3ozjO0BGrrK160XgxM BQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3r9brv0ksf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Jun 2023 16:24:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1687562671; bh=QMPF/tX/08OoXYYgDHIyBoI+lS+pddTJuje4or1ZJ6o=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=DRBCWM2Z1VT1/GwSx4bfMKeNTddSR4f6CyR8mf2lTKkzM96fR26yN4Ho66qnhnNDA
         pWndbh69dcA5hUZ4k8uhxFWcydJib3Eo1v5PutJIvYfVAcVjGlGMwMMqBHevE34giU
         CQIL2qIEqJbrUdoPz4fAuhCGa3iD+z3M6r8yhrLdXxSwViqUJjyb94tmcuIhxxX3ui
         KZrYZv+QROd+UR1pWcQ5iw9Lh4B/9tIXtlLk4Py7lPjvhpF9doJljUmqbEBzEaULhZ
         7bpd2u34bqaEs3K86SKZU1HR+twLxtDLZSUxyxpzSf0pj//1R5retfpb18Q1V+8W78
         FqWwWPmWFWyHg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7CC084012E;
        Fri, 23 Jun 2023 23:24:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id EFFD0A0096;
        Fri, 23 Jun 2023 23:24:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Fa8dIeFr;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D8DAE4013F;
        Fri, 23 Jun 2023 23:24:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRVp0s9C33azS1iy27oIfmcXgNRJA6UwyYdv5fogxVnvepXnjvj+drP+EWEYfxbtEI3v5Rz9Y52qieqsdWCV2JKgqpcBahfcNfeFknILFio1sQuxEERPpZDZt284YSOZPpSNFFTe/bcKsp2F8CSwzmNHQFb/8ykD61dS2zzhUJS5fEcyuKGbD5zlsRzxLp4XdrkVKnSFXqxBCj1757dBkEW9/imRrmWFtX9CJhof75Q8iijNSqR/0MENv8ljhWwraQNh8HmVqPq5azOX6zos4jL+KM9mvhk3n8b7Nfu5M1N3zau8qf5xrYswJ88ve6WEEWK5sAx20MM3I17xwBKDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMPF/tX/08OoXYYgDHIyBoI+lS+pddTJuje4or1ZJ6o=;
 b=S+9gBXJco387jDLxZlmfd55O209zlqRTT3KONJSnKF9mgTNaviPdqdxwv6S7JGPS7IurhyQKfkbP2Bu3JJ3V0ezkC3YOazfy+BUzg9AF8zA5TrP9geELRDJ3JLSN1sW83jK8Sfo8nvUM9FrAm29RsjabQpbywdXm+KleWhOopF6buTYHFtvG07SYnprCZlC8ZeyMkDWgyUXQCapHRF9d6MabKTzTSAxbjiOb6WYFpeHtUJPNnbqxMojUcLZPydNTV+PD4ZSA8ISRQuzIYakcDzx7uSskpkVrkA9WziQGdP/zCs1/LpJ1v+b51Ig1rc1VpV+/9nl9J3UD0kZlhhy23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMPF/tX/08OoXYYgDHIyBoI+lS+pddTJuje4or1ZJ6o=;
 b=Fa8dIeFrRVs88Sp+IcUMITaoqimJ7v/sOcRHr9auBMX2cGQUfvdp09pQ8lFP5TIMCVBeMpQMojKwvtpQ6M7oUZHDUDRgdYv5xoUGQhDu9X170zt0bbQOFwpfjrjJXwKC4UNXEI+ymAEUKbIMouFfFCJnhufSWx9NUZbiE+IIbAA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SJ1PR12MB6169.namprd12.prod.outlook.com (2603:10b6:a03:45c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Fri, 23 Jun
 2023 23:24:25 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b%3]) with mapi id 15.20.6521.024; Fri, 23 Jun 2023
 23:24:25 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 00/11] Cleanup Octeon DWC3 glue code
Thread-Topic: [PATCH 00/11] Cleanup Octeon DWC3 glue code
Thread-Index: AQHZoun2p3xHm/wYXk2RPs2fSTogha+XdTiAgACVkICAAQMQAA==
Date:   Fri, 23 Jun 2023 23:24:24 +0000
Message-ID: <20230623232420.vfvkqkcee5jrrkmo@synopsys.com>
References: <ZJC165p0Mj4jHcBh@lenoch>
 <20230622230149.4wpvtlpsu7473txr@synopsys.com> <ZJVQUzVW+NzCgH7i@lenoch>
In-Reply-To: <ZJVQUzVW+NzCgH7i@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SJ1PR12MB6169:EE_
x-ms-office365-filtering-correlation-id: 4f4714c6-4cda-42b0-01b6-08db7440fb8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ugce2n8c0aZJHHsCH961Wfyuev3+6+UZLl8XWalMEc5aMLyBJJr001W4ZIebLOdGHszxtK6Dd1kBC0oCkl2iYRSx85gXG2agmrKxGNgDrcZPGC5p9Nfe+Qaazo8tsY29Q8zuI/KArxQBSOYiF2hLbCs4VW6Bbadrhft7Uyx9D/qr63rNEqSugToyOwZ4fvhQbaoU6EhArcZfJQ7JnJepxTIjcTt5LUE3R2koWfyTrG0Sulnb6Y4rkShohexTK1H7IsPoweC9yi/mdzbXIhv9tHF5Prg8uyJvorv/II2wVCmYkL+5y95BawRbHi3wXae7twObXJPFsWTzaq8MCNhRKDduYBcVU9ZsGomUz9M5rqpY5hrDVqRa1cJ/9TKB7Iibf+PX5jqKXXmGwn/6PPDYCtd44vnOJ/SKvgxRg9IXnsWxlY7qHAc6MckbQzEWmDm+d4IF9Lwl2LREIAA7fZm49DgAYh1pwtKp5Z21JUQOBuNu4b1PBbxEb/Rshws7UN20GEva2ULMJX046sCS9OHMsy7Nkrmsvn78uU/r9R/FNv7KX/Jg2nN8AX99rRrPlw/rrR2wfjbWCsw91KgV18D+HsTOQKUNFDczwtvM9Ae3E/owi9pUY1Y82+zCSJEPzt2N
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199021)(122000001)(71200400001)(2906002)(38070700005)(478600001)(6486002)(54906003)(38100700002)(316002)(83380400001)(76116006)(66446008)(5660300002)(41300700001)(66946007)(66556008)(64756008)(26005)(36756003)(8676002)(6512007)(8936002)(1076003)(86362001)(186003)(6506007)(6916009)(2616005)(66476007)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDU5SW4xcjNPNzlHUU04QXRyTGxkMnFkTnVLUU9xckZrQi9CeW5sRWJFMzY4?=
 =?utf-8?B?bE8wUnlaZGFXc3BtU0I3TjlkOHNsRGxKbDRXUUU4Q2RrdEMwUWUySHA1U2ZQ?=
 =?utf-8?B?OEEyZGtLVXIrMU8xbDRYUktTcmdpSDlqZU5nWS8vdzl1eWNJTEdXejVuYmo4?=
 =?utf-8?B?clRkejQxYTRhb09qMnlQd2JqK0EvUURPa2NHMm0xeGpLSTBxRTBRT3o2ZlRK?=
 =?utf-8?B?S2pTSGQ0Qk1kSU1jVEZ4VUVxY3lYbWtWM2huYWFycC93VjVwenhDd0RCL1VN?=
 =?utf-8?B?ZXlyU0oraFFCbGJuWFN6WjhiTEtlVlJZUkJsRHZSZGlOVEVvalZzemJ3eWZE?=
 =?utf-8?B?U2ZXVzNpeUs3Q2NZV0FadGl4aDFxenhmTlN5bFpHZW16bG1FMVBkeXBSbWhQ?=
 =?utf-8?B?NjlZMEs0K3BrQ2NlcVZMTW56M2dUTzhtaG1mVTgyZVNOSU0zNUtyWFF0WmRz?=
 =?utf-8?B?Y1g4d2cxa2x0aUJYNldmWW8weFBseFJIVHdmUThtUzMvWjFoUUdmR2tjUGpU?=
 =?utf-8?B?NDFCbmJCS011QmVmWTkwLytYZkR4Tm5vQmsrZU1KWTRNT09GYWlRTW9ZZlE0?=
 =?utf-8?B?VHU4M1R1QlNQV3JQUTBvM1BsZEI0M2tWdTVkR1VUN09QaW5NVUE0Qm9tM0xK?=
 =?utf-8?B?ZDJJWWJiWTVKb09rak5oV0hGZEszS2xyMGMwQXBpbjJkTUk2dERTVDdMc0FH?=
 =?utf-8?B?TEZHZUgwMHgyeHkwdGV1OFYwTzM1M3MvM1lFWTd0NE5oMHBITVc4UVRTWHMz?=
 =?utf-8?B?OHlBNk83dnh5SGJkMWxSMGtMRER3WHdKTE9LSUI5SURMbmlqUlpTaFNOSitY?=
 =?utf-8?B?NEV0d1p3Ly9ROVArNUQybTEzY3ZvRUI5cTB3bjF4RG0wcEUwOUJWQ2NjZFBr?=
 =?utf-8?B?QWxET0U1SmtWb0lySWhMU2RmdWhVcFdrY0Y2Y216U0N2aDk0UW02SmZHb0dX?=
 =?utf-8?B?RXNESGJOUDZaRVZ6MVhjcWZQdE0wVlRsM1liWlJVYzYzVHNZc3hYMXVkSGQz?=
 =?utf-8?B?dnNDQTVhZkNhMmwyNWZHM3VIOGNZczJtOWJvYXd4UnMxQnAwN0FjWmtCcnhW?=
 =?utf-8?B?TnZ6MmhIYkJZd3NoTHdocHl1OENKYTAxdUhwRlRRMUR4citSdm9PcmVwdkJR?=
 =?utf-8?B?alNyaDZKaWk2ZnRoMmFvdHhFa0ZweFJyaWxKTGlaWEpVelRobXJiRWlYeXpL?=
 =?utf-8?B?MjFQa2hXZXp6YmdwVXN0bnJ5a1pORC9VZXphSmlGYnZsbXBWakVrR0krRjAr?=
 =?utf-8?B?Y2gyNHpxaERlMDJaZVQxMDY3aS8vRDRqVkM2UlJkTFpkWk0rbExZeUUxYmpF?=
 =?utf-8?B?cnBZbmxYQW5FWTNUZnhrdnViT1VkNFBXdTNhN0hNTDNubHhKaGJzaSt4RnBv?=
 =?utf-8?B?OUhpUytWbzRyTVdwblJDUnp1RWxmMHV5akhEOEZpVnRsaVdQRm9yc2hHVDVv?=
 =?utf-8?B?cTdZZTRhL1lYZzBwbXY5ZFc0bmJZeTdIdVZIWU54amdDQkNRVEVjdm1ocTNn?=
 =?utf-8?B?RzJSdkJUcVk3UHdCUUd6elNZelhUS1dxMjZQRUtOWU9GeVI3dVpaeWdLYUgx?=
 =?utf-8?B?Sk1vSVBqRHRHQlo2ditGUFkvQkxrWGhWYXNvR052bE4xVVplVG9ud3QyaHJm?=
 =?utf-8?B?UHRLWnlrTmR0TkFPUklubmVZbkNIandud0RFUW1QakxlbzRsYTVDNkdVN1FT?=
 =?utf-8?B?QjVIWUtPNmc0dVRWTDlHR1YwR2p4K0pJY2t2K3NoRjZKS3dKczZDNWJuZ05V?=
 =?utf-8?B?N3F6WkNUMkZPdno3MEFJYzN1K012YXllLzMzQllPNVc3V2tLNHdsdGZSYXh5?=
 =?utf-8?B?SDJmbzBpaCtZeVQyVE1nVzBzTWZLUk9TTEJJMXYzdk5DUE85YSt6L2VYUDNU?=
 =?utf-8?B?N0EwNGtsUkxTQ3c2UXRqNGszb2lvZzFZVVV0OHZnZC9RWVg4RU1VWUxPc0hT?=
 =?utf-8?B?Slo0TTdkYWJ2SDlDODZoUXN1dGZrZ0pWb3RwRVViak5IVWZnVlViTGhQcjN0?=
 =?utf-8?B?dE9uUFFXVDJoWFVQeUdidDlRSW53ZWRaNVRId08xZm5oc0dGR3VkQmtOOVlX?=
 =?utf-8?B?dENURlRPaGJuTDNYV0hmeHZmRU96T1Nhczh1elphSTBIekNXYmpGR3grL3E2?=
 =?utf-8?Q?84vEjygIWy8ADaVlIf7MUkzBf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61D7B249A6687D4E97E174C9BB6EBA52@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: mKhFAsqJI2bRXn/kP/HPvX36FvZYTqmS/dQTmP6BOmLccv0tnMM88LLWEr+Hp1rRZqfDsqt6Vi2BCbTRDi52/TlsIdUJOhddrifYOuy3KHPvc/pjfN5BzIN03RcOw8XTKeO3zRuArVeH9w3YHiWAvP0S3CnCwMkb3Y4znYnbjaUijZtU0GyPWG+XhS91awkUdSO9HK90EPzodR+Cs2vJH8l8YKP0vU2ugPLC/pakdVRth8I59yyE4obeo7pxgIzMYeIxcua5GkAocP1hUJY2llK8wPZRbwyuIKhBzJ1zUKHDw73ofZiZ2A7KcrVQWwmfxixGbu/yeEKxLJw51WgTzKiMStZ9CGyKE4+VhlW/HNbrhePlOtswda9U+JUCTkvRi0LataXTqqz1QENDJR3CvkGYGZV0Np/lq8Y7TZKITaWthS+XEJ8WIUNwG3gcbAL2ies3sJi8kYDjFvSffOohSdDRjew813G7pvcyyEfWjJ9HfN2bkNNBySvBzGq8eyg1JJPjuGWSvSYwb8xrd/mDfSM/EAIzQUTSEUTvBdV6rzgErjaGPCU2kMWdEeUGaPjjx98NVW4iWwvpQJ0mLg8axJSJX41iJST8imT9B8yOo7IHigOmShf99fkop1Wf8uJQVy1k6d1X1S+pBY1FFMnJ9ERoMUq4w/L3bvEg1jDMENqeeDLHO9q1x4Ol1bxtmjwPSsqz7S4d/qGFdamWGO5JKBbrTq6UyDx5bq+71hW768X74QSL0/5qbB96e6NkAtKb8AWe7ZtAVzOJUTpH+LtPapvQRpls43AEz9PBakPBa5UrwkRdPhToTK66z7XNiRYZjWg2Dx56TqefMlQmQAg0JA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4714c6-4cda-42b0-01b6-08db7440fb8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 23:24:24.9341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJMdbSc7yWftMiluAKYhc7JTC8hvO8EiofT+LyV+0Dj+lhWT100k7fy0R7kvV7bSPrrcvVkHwhhfeMlIin0URw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6169
X-Proofpoint-ORIG-GUID: Ib7hjmDEPxFWyV_vSwJgWzrO8szCFl3e
X-Proofpoint-GUID: Ib7hjmDEPxFWyV_vSwJgWzrO8szCFl3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_13,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=866 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306230212
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gRnJpLCBKdW4gMjMsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBIaSwNCj4gDQo+
IE9uIFRodSwgSnVuIDIyLCAyMDIzIGF0IDExOjAxOjU0UE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3
cm90ZToNCj4gPiBIaSwNCj4gW3NuaXBdDQo+ID4gUGxlYXNlIHVzZSBnZXRfbWFpbnRhaW5lci5w
bCB0byBnZXQgYWxsIHRoZSBwcm9wZXIgbWFpbnRhaW5lcnMgdG8gcmV2aWV3DQo+ID4gdGhlIGNo
YW5nZXMuDQo+IA0KPiBUaGF0J3Mgd2hhdCBJIGRpZC4gVGhvbWFzLCBNSVBTIG1haW50YWluZXIg
aXMgcmVhZGluZyBsaW51eC1taXBzIGxpc3QsDQo+IEdyZWcgaXMgcmVhZGluZyBsaW51eC11c2Ig
bGlzdCwgeW91IHdlcmUgdGhlIG9uZSB3aG8gcmVjZWl2ZXMgY2hhbmdlcywNCj4gaGVuY2UgYWxs
IHBhdGNoZXNldCB3YXMgc2VudCB0byB5b3UgaW4gYSBob3BlIHlvdSBwcm92aWRlIHNvbWUgY29t
bWVudHMNCj4gYWJvdXQgYWN0dWFsIGNvZGUgY2hhbmdlcy4NCg0KSSBjYW4gdGFrZSBhIGxvb2sg
YXQgdGhlIGNoYW5nZXMuIEhvd2V2ZXIsIHRoZSBwYXRjaGVzIHdlcmUgc2VudA0KZGlyZWN0bHkg
VG86IG1lIGZvciBwYXRjaGVzIHJlbGF0ZWQgTUlQUyBhbmQgbm8gb25lIGVsc2UgZXhjZXB0IHRo
ZQ0KbGludXgtdXNiIGxpbnV4LW1pcHMgKHdpdGhvdXQgVGhvbWFzKSwgd2hpY2ggZG9lc24ndCBs
b29rIHJpZ2h0Lg0KDQpJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhlIE1JUFMgc3Vic3lzdGVtLCBi
dXQgdHlwaWNhbGx5IGZvciB0aGUgVVNCDQptYWlsaW5nIGxpc3QsIHdlIGNhcHR1cmUgYWxsIHRo
ZSBlbWFpbHMgZ2VuZXJhdGVkIGZyb20gZ2V0X21haW50YWluZXIucGwNCmFuZCBpbmNsdWRlIHRo
ZW0gVG86IGFuZCBDYzogc2hvdWxkIHRoZXkgbmVlZCBhdHRlbnRpb24gdG8gdGhlIGNoYW5nZXMu
DQpPZnRlbiB3ZSBmaWx0ZXIgb3VyIGVtYWlscyBiYXNlZCBvbiB3aGV0aGVyIGl0J3MgZGlyZWN0
ZWQgdG93YXJkIHVzLCBhdA0KbGVhc3QgSSBkbyB0aGF0LiBBbHNvLCB3ZSBjYW4ndCBiZSBzdXJl
IGlmIGV2ZXJ5b25lIHN0aWxsIHN1YnNjcmliZXMgdG8NCnRoZSBjb3JyZXNwb25kaW5nIG1haWxp
bmcgbGlzdC4NCg0KPiANCj4gPiBTaW5jZSB0aGlzIGlzIGEgbGFyZ2UgY2hhbmdlIGludm9sdmlu
ZyBkaWZmZXJlbnQgc3Vic3lzdGVtcywgaWYNCj4gPiBwb3NzaWJsZSwgcGxlYXNlIHNwbGl0IHRo
ZSBjaGFuZ2VzIHJlbGF0ZWQgdG8gTUlQUyBhbmQgdHJ5IHRvIHVwc3RyZWFtDQo+ID4gdGhvc2Ug
Zmlyc3QgYXMgdGhleSB3aWxsIGFmZmVjdCBob3cgZHdjMyBnbHVlIGRyaXZlciB3aWxsIGxvb2su
DQo+IA0KPiBUaGF0J3MgcHJldHR5IHN0cmFpZ2h0Zm9yd2FyZCBhcyBwYXRjaHNldCBpcyBhcnJh
bmdlZCBleGFjdGx5IHRoaXMgd2F5LA0KPiBzbyBNSVBTIG1haW50YWluZXIgaXMgZnJlZSB0byBh
cHBseSBwYXRjaGVzIHRpbGwgZHJpdmVyIG1vdmUuDQo+IEhvd2V2ZXIsIGFueSBhY3R1YWwgZmVl
ZGJhY2sgd291bGQgYmUgc3RpbGwgdXNlZnVsbC4gSW4gY2FzZSBpdCBnZXRzDQo+IHNvbWUgYWNr
cyBJJ2xsIGFkZCB0aGVtIGFuZCByZWJhc2UgcGF0Y2hlcyB0byB0aGUgbGF0ZXN0IC1uZXh0Lg0K
PiANCg0KVGhlbiB0aGF0J3MgZ29vZC4gSWYgdGhlIE1JUFMgbWFpbnRhaW5lciBhcHByb3ZlcyBh
bGwgdGhlIE1JUFMgcmVsYXRlZA0KY2hhbmdlcyBhbmQgYWxyZWFkeSBwaWNrIHRoZW0gdXAsIHRo
ZXJlIHNob3VsZCBiZSBubyBwcm9ibGVtLg0KDQpUaGFua3MsDQpUaGluaA==
