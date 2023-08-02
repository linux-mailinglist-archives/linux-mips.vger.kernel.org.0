Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE4076C191
	for <lists+linux-mips@lfdr.de>; Wed,  2 Aug 2023 02:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjHBAnE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Aug 2023 20:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjHBAnD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Aug 2023 20:43:03 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D76B10C7;
        Tue,  1 Aug 2023 17:43:01 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 371NZsLx024105;
        Tue, 1 Aug 2023 17:42:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=qB8XsL+uCReXVxcYV00HAYxq6EvDu5MgGX2Dj506XuA=;
 b=EqjYmW20zQlRjMC2GooZIzGsAGbT+K+A3lQplh+mwPMxeEPBGnO35jj/v+x0WksEHxco
 0EKnT7aOApTt6ErmXst1WJCdejPyPY/5KfXKfT9/huAyACHgOEyZXrV0ucnSpof/41nE
 lfzCgxm7LXvLSijYOb4fu7PbfJL4yr1Q/UurjxuSupvR93fffQ3hsVqQNSWZDQiFq+D6
 8ROV2PYfWCQ2SnQ7M2LPWk845VUvwZDYTPprPgU6CRno3hi9/phGeG10fYek758y9r0T
 kl50XThDvzfGqeZcAIzToGN/rH5x5PjIkZxP4Zq5oiPVcW3wlU+6pCaPF6BYx/N/wzNo 9Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3s51psyr7u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Aug 2023 17:42:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1690936967; bh=qB8XsL+uCReXVxcYV00HAYxq6EvDu5MgGX2Dj506XuA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=HsAIAIS9EF+GgD/IeVD9umM4NqmJRuOS93UVtHLoGimQjXBX6YA8RL8nYegCXwyvM
         E4MJsjKWpl2kuOwBC9nDX+hY8r5xHF323dyXg8Xgw4+MHD4K7lf71pF19NljqzfIwM
         T2Bisu31VpwDAnRYEjW2Bq7Iq68eDD/U+jad32Mv1kXFvWA0Meo9KRNaGvSYDQ42eS
         uHZJKImfzUWN8aLZ+19OIXHJ43fkpoT/UXqOKTN5Yo5nwFXOpi4qkrYEmHN0slQivH
         MdD5zcM8ctYyv/4Ybtg+sj2kzejO8SFbBnFncVeSmrycZpppt5SVbxG+9NQibzURDC
         ZnxU3EilbbJoQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 327AC405C9;
        Wed,  2 Aug 2023 00:42:45 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2FA38A0090;
        Wed,  2 Aug 2023 00:42:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=rk/Ks3dE;
        dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0CE61404B0;
        Wed,  2 Aug 2023 00:42:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGMK84GrkuuIjW2m+iNA1J2VXp2aFCNhNTiOT0pQJbpOJVf2zkAbRPbLRlu0ksq01zWeZ+MzhyMy/s3q0EyODy61CjqH3DcDGsscZq+kD2VckNDzvZPuIqdbXAWEFIs3kmvR4XzglGX4Xmc7yJdy0grlpSwrmJv70YTkM3Tz02DpPxjGw4OkiKkByjc7W9dRmAcVpocNtdpw1q+TPzCDnTzq4yGF1eEGiOgEUPdoMRR5KV3CIPSxMhHkGXuZ4l+OjgXLuHDbu7LY9cmrMIR5vCzDpwZJHouwuZP8JaZo2swCwuEe1h/NaTR+Iktc4EoOT6OhYGgK2ZN6XJ9jLidrFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qB8XsL+uCReXVxcYV00HAYxq6EvDu5MgGX2Dj506XuA=;
 b=ZSroht0Ik7xio5cragm4O9tI8lod/6rCj4o5sym52HeykhWiM9SVuOFqEW5QWrTAhZ7IW+692AE+m6eaHn6snu0fd8JrOm54P6Q09Md+HV+KJ6L2t1CjDLjhnvYm4zJl5YeXmXQhG3lyVqJ/e1XPfLPTSD5WHz49V/YdNIDeE/CnxJkzkQiVn35q+M4DJ36jHXgIIXUweeerZ3+tXEhQKohH6BHniOqjIQkN514jKxjRkcA4+vm77lAIMXxUyHBs2zaXpdFt63bRk7wgUxsMArUZmD5EbHvhN0oXKejY/H0qG1sQpAX9NY0QR6ZFm8TtGElNYdt5TpZDJqDptwcWGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qB8XsL+uCReXVxcYV00HAYxq6EvDu5MgGX2Dj506XuA=;
 b=rk/Ks3dEJ42Jmgy7wT8UGfOMmpxIO0Z3GNivrT/Iwm490F/nEL06UoW4DJMYzmDfvtKTnqJ8ZOZndRc+WiJaikan0BnJSSkbc9aogbLD+Q5j6YNcHwqUOlWENIGnly7UcLTHRf0Rg0y49HEV3kjjCkiieR4ESFDfEduzlB3i+bw=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Wed, 2 Aug
 2023 00:42:36 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::588e:6476:a6eb:d698]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::588e:6476:a6eb:d698%4]) with mapi id 15.20.6631.043; Wed, 2 Aug 2023
 00:42:35 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 4/7] usb: dwc3: dwc3-octeon: Avoid half-initialized
 controller state
Thread-Topic: [PATCH v5 4/7] usb: dwc3: dwc3-octeon: Avoid half-initialized
 controller state
Thread-Index: AQHZw5Hq0x+4HFony0iQUSJ7/Fn126/UmeIAgABTiYCAAT/ZAA==
Date:   Wed, 2 Aug 2023 00:42:35 +0000
Message-ID: <20230802004224.3er3dde3bjnww7yi@synopsys.com>
References: <ZMd/HzISn0mPsNWt@lenoch> <ZMd/oMRx8ze22/kK@lenoch>
 <20230801003838.ifbydrbwq34df3n3@synopsys.com> <ZMiaIUy6d5gVl7mA@lenoch>
In-Reply-To: <ZMiaIUy6d5gVl7mA@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MN0PR12MB6341:EE_
x-ms-office365-filtering-correlation-id: 215d957c-b025-483a-fa32-08db92f15d6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bD73IK4iwTPmvBeoCGhINh/T0RwLss2mx+riyGrVDm4ZD+wgILfXslWjvf1LwX03MYMpjB5filYLytVhpzUcTgxrLHVmjCyXZjI3YcqGq3uPdn5A5kLosnmImCT6/8arE25htIZkkjfwQUZoEICj+nY8yUKB1vgzeTC849YwQft2J7Am9r3bxIFv6DvVyjQgY3VK0amUl65zME296TFsDR/x0okA6OGqzXC3xIX8V4X0Pt3cTYHoUMbm2mU0Qhd3CF6vCAyVXgCjoEzFEM1sbzut/ceujBHiaS6ZDzv+6Jra+F4Rk730KR8yaG0J1nt8mzhHywCtvgCySCYHfosoBTS0gpl1f2RGpiSNv9aiKavZHRZhcUKRGwEK0eZ8OBm2PCLVFO6x2ozIfKpS1gv6aPhFNiq6lv1FFWsG2qtVKcGGdKdG0OJeiuuJXAJfQsi53iaX5CwrM/CmgiOUJS3vJIYVxsV0HjDZzqzHLhU3DvI2lD8T51DX5ZcY60VS4CUMzps+gVIWXbHn0r/C0bgTRFJNibO6JKUGeUGme42qUpMO3okM8WcCRW89rKOQvHt3+BXtTiPGDNFvJby7Q7SpZYh/whGWXYajtO7CQo+11TXfp1rqNYz9veNyr4q1mGcV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199021)(6486002)(6512007)(86362001)(71200400001)(38070700005)(36756003)(186003)(2616005)(83380400001)(26005)(1076003)(6506007)(38100700002)(122000001)(4326008)(6916009)(2906002)(66446008)(66476007)(76116006)(66556008)(66946007)(316002)(64756008)(5660300002)(41300700001)(8936002)(8676002)(478600001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmkvdGhjQ3JaYkFFZUp3YzRHdThqL0pqQ3d5dGIrUE9xai82ajhhMUhFbGwz?=
 =?utf-8?B?UjlEdnZ0VGR2blphRFRZb0Q5KzlKaWMwS09WYlZpUGEzNTJYekU0cjdMbjZu?=
 =?utf-8?B?QnRuQzBwaDBPZWJ2blg4RmkwSnQvbWh6SjRyZXdzNTFOOTg4T2YrVVpybnVy?=
 =?utf-8?B?TjlXNk9tYUxBaVZtVEFzcnlwdmwyZGUvTnAzaXNRN00wNEhNaVdacFZtampv?=
 =?utf-8?B?OVdwUEtielA3VUhvaUpQUnZPOVNIZWY5SVhjV0EwcGFsSndWbUlGUVdlWTV0?=
 =?utf-8?B?dU9jZlYyQ3VlbDZ0TFZESDhMK2RmSENENlp2MXJES1UwMmdTd2RoVWxxRDZk?=
 =?utf-8?B?ZldLVlZ1d0hZdnRzclVKNlBBNjRwdTQrM29kdGc4cnBnelV3ekFnaHRhOXVM?=
 =?utf-8?B?Sk5sbkJla1pXU1pFaWRFVkNsZUt4anlzeXVqT1lSRUU0NFJPNWZpN2ZKZGtn?=
 =?utf-8?B?blJFNG9VS3V6dmF1RzYrMFZxYzZBd21BY2ZvMHpWM245d1pCenBtekozMVZU?=
 =?utf-8?B?UmhUSjhjT0JrV0NhaitCbVFJWTRaMVJjR2pVVnBzWXd5aXJicFhma3d6cXIy?=
 =?utf-8?B?YlV5eFlZZHI3U1JlYUc0TVZQY0o0SGQrbmV3eTU4cDNlQU1BRzRPR0loaHBT?=
 =?utf-8?B?Y0lWSE92Nm9adHJXdUZJS0huYVZoakJnbEVUb1JpenhhL1JrbnZ2a3hxVzFE?=
 =?utf-8?B?dlhXV3RXcS9uKzNwUE1zd3MzZ0o4T2lLN0JqdGlFdG1JQTlUcTdnamVTNUdB?=
 =?utf-8?B?cXEzNDBLT2h1VjhJU3RvQW9MT2JVV2h1bXJJYjhpUHN1VG9VYW9Od2taQ0FC?=
 =?utf-8?B?Y2JKTGtKQXBEWXY3czNadld5TkV0MmYwSDhJQnF1aWQ3WlVrZ3Zpd09vZldF?=
 =?utf-8?B?WFZ6TDlPT29mejdWMkZpR0dObGJKY3ZmRzc4NkVaWlpDRjJRbjRoRnhsUHZu?=
 =?utf-8?B?SEhKdEdwQkdkVkYwZVVMMSswQ0t1MlVJU1MyS1hsdndBOGZXdG4wa0Mrb2lx?=
 =?utf-8?B?L29kZDJzRzdRbzJwemN1c1VOc0ZSSExYcHZucEFVSDQvZHd4NlpCYlR1YTZZ?=
 =?utf-8?B?S3A3dGpRWkdFenJEOFNHL3F6bldYeU9ZNS9oZGFTb3RiZlhKNE9rWHpURGlM?=
 =?utf-8?B?N1hvZ29tSTUxVFp3WUtvc2xqU3A1RTFMNXNEUEl4K3FhN2FER0pIZUdWOGVs?=
 =?utf-8?B?MTcxTmNNbXMxZUtQc3NUSU1VWjR2dk5FeUJDT1AreHFHZzB1UmxCM2NvT1hq?=
 =?utf-8?B?RHhpQStqSmNXWkFYS3kxaWpqNXJZYW5FU3hiV1NXSEh1cE9YVVFsalVJSmc2?=
 =?utf-8?B?c2hiNnFXWnd0dGROeERBWGg4c0t3dER1WGYweVc5SjFRRDBla1VHNkRvV2hY?=
 =?utf-8?B?ajNLMEhvUU1vMEgxcVc0M05BUHlQcjRwNzVrK05wMjJ0M1R6VGZNZzg3enYr?=
 =?utf-8?B?L3pxUytDV3hWTDdSZE9NK0JndklOMXVlc3kveVZadCtvLzc3dEVueW5JRmFG?=
 =?utf-8?B?Ukg5VkcyUzZhV3QreWpEdG9mL2c4K0JZYXp0UlhESC9LbHpFZEdIQ0k0bm8y?=
 =?utf-8?B?ZmpxdzFFTTBBNDQ5aXJCQ1lySHhFaWVHdDRrTmtuMFIyTDAwMTJudUxtZXBS?=
 =?utf-8?B?L1BiWk5YL21pS1N0SG1nWTBsbW1jSmtzN2VNWEhUcFl4Y1AzcTI5bVNOYU5C?=
 =?utf-8?B?cThsLzhJWVYrQ2RGUjFBYk8zWEhTanBDUHRaeFB0UW1vL1grOVJIQTNIL0tH?=
 =?utf-8?B?MEVzZjkvWjdmUlZwNll3ZFZ5MGJIM09rdDJSTjlFZ21JekFXU1RnTG8wRFFj?=
 =?utf-8?B?T0FRR2p5UDI3bVRTQVlEMGZlYzk4eE1tb1o1bDZOUUtjMXVTb0VxNFoyV3du?=
 =?utf-8?B?U0x3RVI3cDlIRmNBV2hrRHJUVllnbzYzUDdKK0N5VGhia3VUZGxCWWx0ZHly?=
 =?utf-8?B?YnpIWFdwVDZpTzFvWGdVbWdHYnJ6b0ptRHliV1k3YjJ1TTNpRVVhQ1dlc3RW?=
 =?utf-8?B?YXFQWFZzN0ZCaTBlWng4bGRUQkx3VW00TVBTa1A3OEgyTk15TjhibGN4TDNK?=
 =?utf-8?B?QUk3Z2piVGdRcFIwUE9TRHdJMGszaktQcVpBbmkvbjlsODhzOHBMSzVBYTla?=
 =?utf-8?Q?DGwL7sQe0BFh9iNoYxHx6v4MP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <877EDF27D36F3A4CAEC8341AAF892EE9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?ZVZuYldmbzA0WFB4RURqdGw0UEM1WlZLTGVYYU5sd2FwbTg0NkMvc2ROTGkw?=
 =?utf-8?B?RXNvbXhkQUxFM2ExcmZWQnpDeFdxejFDTk1FMk9jSU5OQ0FlcVB3ZmIyRkNa?=
 =?utf-8?B?b01qdURFMnAzZklyTDd3Wm43UFhKbTMzN0gxTDNtOXNxaVZDa05vTDdKaUZv?=
 =?utf-8?B?Yk9pSk53SUZPT0NQZlpRZDVjbFpRVldjVmVxNWhmQjNLczZ5a0FZaGljM0RS?=
 =?utf-8?B?RHhQVWhta2pDMy9la1A4aHpZdm5KdlE5cW1oL3VEVjVySHFsN0lQRHV4TEpD?=
 =?utf-8?B?TmdMQVl2eGhabFhOOU9WWjNDcWp3eURLY29sci9BazRleDRpQ2xoRFJHNVh4?=
 =?utf-8?B?MGlUYXExVmdJbzNYYzNPc1ZUOGI0cTFXVUhtTXM3K3Y1T3VURXNCS3VybVda?=
 =?utf-8?B?QjRnK1M2S3dDSjcrNzhqT1NEOFZ4cFl5TC9PL2ROaDYwS2M5dkIxVVJaMm16?=
 =?utf-8?B?WGIvcVo3M2JPRE1sYkx2cUNaWWpyWmJGNlluQ2c2c3lqSVluSFhCNDlBZEZY?=
 =?utf-8?B?M0xqQ3F6N3laZWJ2Z1VQN0lvYUI5V2ltV0xTeGxMRkUvYWJzY3FJUlZqcnNi?=
 =?utf-8?B?bmUwdWdnRkpITWZOaVNNczJKbVBuTEU5bDltKy9DbUZqeVhJNTZuYnRKaE9G?=
 =?utf-8?B?KzlpK2JKdHJOUVFOaVdRMHkzTDFsVGc4TkJUOTVmcndCdGVFeFNLbEhaU1o5?=
 =?utf-8?B?Mi90dkR2QjdXWjdpTmJ4aXQ4aUwvSUhaNGF3dU5MMFFyU1RoeVUyemxiMFI3?=
 =?utf-8?B?a3VIN1NGR2ExV3pvYUdJWmhPVzZ2UEpWY2svTS9KeWFHb2VhUklNWi9kN2dx?=
 =?utf-8?B?bmFJYzJiNXBEKzA1dFVIWS9rcmUrUVVUcHpxMDB1TTNPOW9NcUhtZW5rZVFu?=
 =?utf-8?B?NlJqV1JRVWxVNDQxcHlnbzhvYzk1VVRIbVdERHcyWDc0My9LVy9OQ3NtZEFF?=
 =?utf-8?B?SUo5YWppM2w5RVRxK2xmWE1KTTJqMkEvYU11NjhvZVh6L2JVNnZwMDFySjAz?=
 =?utf-8?B?NVhHY3F3NnUvUVlVQzZJY2h4RjRBZ1g2bXhDdWkvc0dBTHoxalJFN3R5bHdS?=
 =?utf-8?B?SnlUWEZGTDlPcUROT1RkNzlnanVmUC9VVUJpOE1mdGZ4TkJ6Mm12ZmtwVlpO?=
 =?utf-8?B?dDY2blcxZjUwWlZEOXMxYUUwVHMyZThselYxdUY0YjNWQVQraHYwM1hTRTd0?=
 =?utf-8?B?T2lyYWlGdlRyTUFkZURrNHRnczZHZWVtRlFvYUFrY3FpSmQrSXJ5eW0zaG9B?=
 =?utf-8?Q?D8H0wLkFNKMhh4H?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 215d957c-b025-483a-fa32-08db92f15d6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 00:42:35.5156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IUpKNPLf3MiPXM20Mbop0cjVUosxCQG5oo2hYFzs4OGW/eVj4DMZPETiYGr7GPbxdlKFs7do8igzvLgVkAtb/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
X-Proofpoint-ORIG-GUID: 6QE34r_-3tAtD2T6UWFZ58eXXmzHyfr0
X-Proofpoint-GUID: 6QE34r_-3tAtD2T6UWFZ58eXXmzHyfr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_21,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308020003
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gVHVlLCBBdWcgMDEsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBPbiBUdWUsIEF1
ZyAwMSwgMjAyMyBhdCAxMjozODo0M0FNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4g
T24gTW9uLCBKdWwgMzEsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiA+ID4gRnJvbTog
TGFkaXNsYXYgTWljaGwgPGxhZGlzQGxpbnV4LW1pcHMub3JnPg0KPiA+ID4gDQo+ID4gPiBQb3dl
ciBncGlvIGNvbmZpZ3VyYXRpb24gaXMgZG9uZSBmcm9tIHRoZSBtaWRkbGUgb2YNCj4gPiA+IGR3
YzNfb2N0ZW9uX2Nsb2Nrc19zdGFydCBsZWF2aW5nIGhhcmR3YXJlIGluIGhhbGYtaW5pdGlhbGl6
ZWQNCj4gPiA+IHN0YXRlIGlmIGl0IGZhaWxzLiBBcyB0aGF0IGluZGljYXRlcyBkd2MzX29jdGVv
bl9jbG9ja3Nfc3RhcnQNCj4gPiA+IGRvZXMgbW9yZSB0aGFuIGp1c3QgaW5pdGlhbGl6ZSB0aGUg
Y2xvY2tzIHJlbmFtZSBpdCBhcHByb3ByaWF0ZWx5DQo+ID4gPiBhbmQgdmVyaWZ5IHBvd2VyIGdw
aW8gY29uZmlndXJhdGlvbiBpbiBhZHZhbmNlIGF0IHRoZSBiZWdpbm5pbmcNCj4gPiA+IG9mIGRl
dmljZSBwcm9iZS4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkaXNsYXYgTWljaGwg
PGxhZGlzQGxpbnV4LW1pcHMub3JnPg0KPiA+ID4gLS0tDQo+ID4gPiAgQ0hBTkdFUzoNCj4gPiA+
ICAtIHY0OiBuZXcgcGF0Y2gNCj4gPiA+ICAtIHY1OiB1c2UgdWludHB0cl90IGluc3RlYWQgb2Yg
dTY0IHRvIHJldHlwZSBiYXNlIGFkZHJlc3MgdG8gbWFrZSAzMmJpdA0KPiA+ID4gICAgICAgIGNv
bXBpbGVycyBoYXBweS4NCj4gPiA+IA0KPiA+ID4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rl
b24uYyB8IDkwICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4gPiA+IGluZGV4IDI0ZTc1ODgxYjVjZi4uMGRjNDVk
ZGExMzRjIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5j
DQo+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4gPiA+IEBAIC0x
OTIsNiArMTkyLDggQEAgc3RydWN0IGR3YzNfb2N0ZW9uIHsNCj4gPiA+ICAJdm9pZCBfX2lvbWVt
ICpiYXNlOw0KPiA+ID4gIH07DQo+ID4gPiAgDQo+ID4gPiArI2RlZmluZSBEV0MzX0dQSU9fUE9X
RVJfTk9ORQkoLTEpDQo+ID4gPiArDQo+ID4gPiAgI2lmZGVmIENPTkZJR19DQVZJVU1fT0NURU9O
X1NPQw0KPiA+ID4gICNpbmNsdWRlIDxhc20vb2N0ZW9uL29jdGVvbi5oPg0KPiA+ID4gIHN0YXRp
YyBpbmxpbmUgdWludDY0X3QgZHdjM19vY3Rlb25fcmVhZHEodm9pZCBfX2lvbWVtICphZGRyKQ0K
PiA+ID4gQEAgLTI1OCw1NSArMjYwLDE1IEBAIHN0YXRpYyBpbnQgZHdjM19vY3Rlb25fZ2V0X2Rp
dmlkZXIodm9pZCkNCj4gPiA+ICAJcmV0dXJuIGRpdjsNCj4gPiA+ICB9DQo+ID4gPiAgDQo+ID4g
PiAtc3RhdGljIGludCBkd2MzX29jdGVvbl9jb25maWdfcG93ZXIoc3RydWN0IGRldmljZSAqZGV2
LCB2b2lkIF9faW9tZW0gKmJhc2UpDQo+ID4gPiAtew0KPiA+ID4gLQl1aW50MzJfdCBncGlvX3B3
clszXTsNCj4gPiA+IC0JaW50IGdwaW8sIGxlbiwgcG93ZXJfYWN0aXZlX2xvdzsNCj4gPiA+IC0J
c3RydWN0IGRldmljZV9ub2RlICpub2RlID0gZGV2LT5vZl9ub2RlOw0KPiA+ID4gLQl1NjQgdmFs
Ow0KPiA+ID4gLQl2b2lkIF9faW9tZW0gKnVjdGxfaG9zdF9jZmdfcmVnID0gYmFzZSArIFVTQkRS
RF9VQ1RMX0hPU1RfQ0ZHOw0KPiA+ID4gLQ0KPiA+ID4gLQlpZiAob2ZfZmluZF9wcm9wZXJ0eShu
b2RlLCAicG93ZXIiLCAmbGVuKSAhPSBOVUxMKSB7DQo+ID4gPiAtCQlpZiAobGVuID09IDEyKSB7
DQo+ID4gPiAtCQkJb2ZfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkobm9kZSwgInBvd2VyIiwgZ3Bp
b19wd3IsIDMpOw0KPiA+ID4gLQkJCXBvd2VyX2FjdGl2ZV9sb3cgPSBncGlvX3B3clsyXSAmIDB4
MDE7DQo+ID4gPiAtCQkJZ3BpbyA9IGdwaW9fcHdyWzFdOw0KPiA+ID4gLQkJfSBlbHNlIGlmIChs
ZW4gPT0gOCkgew0KPiA+ID4gLQkJCW9mX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KG5vZGUsICJw
b3dlciIsIGdwaW9fcHdyLCAyKTsNCj4gPiA+IC0JCQlwb3dlcl9hY3RpdmVfbG93ID0gMDsNCj4g
PiA+IC0JCQlncGlvID0gZ3Bpb19wd3JbMV07DQo+ID4gPiAtCQl9IGVsc2Ugew0KPiA+ID4gLQkJ
CWRldl9lcnIoZGV2LCAiaW52YWxpZCBwb3dlciBjb25maWd1cmF0aW9uXG4iKTsNCj4gPiA+IC0J
CQlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+IC0JCX0NCj4gPiA+IC0JCWR3YzNfb2N0ZW9uX2NvbmZp
Z19ncGlvKCgodTY0KWJhc2UgPj4gMjQpICYgMSwgZ3Bpbyk7DQo+ID4gPiAtDQo+ID4gPiAtCQkv
KiBFbmFibGUgWEhDSSBwb3dlciBjb250cm9sIGFuZCBzZXQgaWYgYWN0aXZlIGhpZ2ggb3IgbG93
LiAqLw0KPiA+ID4gLQkJdmFsID0gZHdjM19vY3Rlb25fcmVhZHEodWN0bF9ob3N0X2NmZ19yZWcp
Ow0KPiA+ID4gLQkJdmFsIHw9IFVTQkRSRF9VQ1RMX0hPU1RfUFBDX0VOOw0KPiA+ID4gLQkJaWYg
KHBvd2VyX2FjdGl2ZV9sb3cpDQo+ID4gPiAtCQkJdmFsICY9IH5VU0JEUkRfVUNUTF9IT1NUX1BQ
Q19BQ1RJVkVfSElHSF9FTjsNCj4gPiA+IC0JCWVsc2UNCj4gPiA+IC0JCQl2YWwgfD0gVVNCRFJE
X1VDVExfSE9TVF9QUENfQUNUSVZFX0hJR0hfRU47DQo+ID4gPiAtCQlkd2MzX29jdGVvbl93cml0
ZXEodWN0bF9ob3N0X2NmZ19yZWcsIHZhbCk7DQo+ID4gPiAtCX0gZWxzZSB7DQo+ID4gPiAtCQkv
KiBEaXNhYmxlIFhIQ0kgcG93ZXIgY29udHJvbCBhbmQgc2V0IGlmIGFjdGl2ZSBoaWdoLiAqLw0K
PiA+ID4gLQkJdmFsID0gZHdjM19vY3Rlb25fcmVhZHEodWN0bF9ob3N0X2NmZ19yZWcpOw0KPiA+
ID4gLQkJdmFsICY9IH5VU0JEUkRfVUNUTF9IT1NUX1BQQ19FTjsNCj4gPiA+IC0JCXZhbCAmPSB+
VVNCRFJEX1VDVExfSE9TVF9QUENfQUNUSVZFX0hJR0hfRU47DQo+ID4gPiAtCQlkd2MzX29jdGVv
bl93cml0ZXEodWN0bF9ob3N0X2NmZ19yZWcsIHZhbCk7DQo+ID4gPiAtCQlkZXZfaW5mbyhkZXYs
ICJwb3dlciBjb250cm9sIGRpc2FibGVkXG4iKTsNCj4gPiA+IC0JfQ0KPiA+ID4gLQlyZXR1cm4g
MDsNCj4gPiA+IC19DQo+ID4gPiAtDQo+ID4gPiAtc3RhdGljIGludCBkd2MzX29jdGVvbl9jbG9j
a3Nfc3RhcnQoc3RydWN0IGR3YzNfb2N0ZW9uICpvY3Rlb24pDQo+ID4gPiArc3RhdGljIGludCBk
d2MzX29jdGVvbl9zZXR1cChzdHJ1Y3QgZHdjM19vY3Rlb24gKm9jdGVvbiwNCj4gPiA+ICsJCQkg
ICAgIGludCBwb3dlcl9ncGlvLCBpbnQgcG93ZXJfYWN0aXZlX2xvdykNCj4gPiA+ICB7DQo+ID4g
PiAgCWludCBpLCBkaXYsIG1wbGxfbXVsLCByZWZfY2xrX2ZzZWwsIHJlZl9jbGtfc2VsID0gMjsN
Cj4gPiA+ICAJdTMyIGNsb2NrX3JhdGU7DQo+ID4gPiAgCXU2NCB2YWw7DQo+ID4gPiAgCXN0cnVj
dCBkZXZpY2UgKmRldiA9IG9jdGVvbi0+ZGV2Ow0KPiA+ID4gIAl2b2lkIF9faW9tZW0gKnVjdGxf
Y3RsX3JlZyA9IG9jdGVvbi0+YmFzZSArIFVTQkRSRF9VQ1RMX0NUTDsNCj4gPiA+ICsJdm9pZCBf
X2lvbWVtICp1Y3RsX2hvc3RfY2ZnX3JlZyA9IG9jdGVvbi0+YmFzZSArIFVTQkRSRF9VQ1RMX0hP
U1RfQ0ZHOw0KPiA+ID4gIA0KPiA+ID4gIAlpZiAoZGV2LT5vZl9ub2RlKSB7DQo+ID4gPiAgCQlj
b25zdCBjaGFyICpzc19jbG9ja190eXBlOw0KPiA+ID4gQEAgLTQ1NCw4ICs0MTYsMjEgQEAgc3Rh
dGljIGludCBkd2MzX29jdGVvbl9jbG9ja3Nfc3RhcnQoc3RydWN0IGR3YzNfb2N0ZW9uICpvY3Rl
b24pDQo+ID4gPiAgCXVkZWxheSgxMCk7DQo+ID4gPiAgDQo+ID4gPiAgCS8qIFN0ZXAgOGM6IFNl
dHVwIHBvd2VyIGNvbnRyb2wuICovDQo+ID4gPiAtCWlmIChkd2MzX29jdGVvbl9jb25maWdfcG93
ZXIoZGV2LCBvY3Rlb24tPmJhc2UpKQ0KPiA+ID4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiAr
CXZhbCA9IGR3YzNfb2N0ZW9uX3JlYWRxKHVjdGxfaG9zdF9jZmdfcmVnKTsNCj4gPiA+ICsJdmFs
IHw9IFVTQkRSRF9VQ1RMX0hPU1RfUFBDX0VOOw0KPiA+ID4gKwlpZiAocG93ZXJfZ3BpbyA9PSBE
V0MzX0dQSU9fUE9XRVJfTk9ORSkgew0KPiA+ID4gKwkJdmFsICY9IH5VU0JEUkRfVUNUTF9IT1NU
X1BQQ19FTjsNCj4gPiA+ICsJfSBlbHNlIHsNCj4gPiA+ICsJCXZhbCB8PSBVU0JEUkRfVUNUTF9I
T1NUX1BQQ19FTjsNCj4gPiA+ICsJCWR3YzNfb2N0ZW9uX2NvbmZpZ19ncGlvKCgoX19mb3JjZSB1
aW50cHRyX3Qpb2N0ZW9uLT5iYXNlID4+IDI0KSAmIDEsDQo+ID4gPiArCQkJCQlwb3dlcl9ncGlv
KTsNCj4gPiANCj4gPiBMZXQncyBub3QgY2FzdCBpdCBsaWtlIHRoaXMuIEl0J3Mgbm90IHJlYWRh
YmxlLiBNYWtlIHRoZSBsb2dpYw0KPiA+IGludGVudGlvbmFsIGFuZCBjbGVhcjoNCj4gPiBlLmcu
OiBpbnQgaW5kZXggPSAhIShvY3Rlb24tPmJhc2UgJiBCSVQoMjQpKTsNCj4gPiBkd2MzX29jdGVv
bl9jb25maWdfZ3BpbyhpbmRleCwgcG93ZXJfZ3Bpbyk7DQo+IA0KPiBJJ2QgcHJlZmVyIHRvIHN0
aWNrIHdpdGggb3JpZ2luYWwgY29kZS4NCg0KSSBkaWRuJ3Qga25vdyB0aGUgcmVhc29uaW5nIGJl
aGluZCB0aGUgb3JpZ2luYWwgY29kZS4gTXkgZXhhbXBsZSB3b3VsZA0Kb25seSBhcHBseSBpZiB0
aGUgbG9naWMgaXMgbWVhbnQgZm9yIGEgY2VydGFpbiBjb250ZXh0Lg0KDQo+IA0KPiA+IEl0J3Mg
b2RkIHRoYXQgdGhlICJpbmRleCIgaXMgYmVpbmcgdXNlZCBhcyBib29sZWFuIGhlcmUuDQo+ID4N
Cj4gPiBSZWdhcmRsZXNzLCBJIGRvbid0IGtub3cgd2hhdCB0aGlzIG1hZ2ljIG9mZnNldCBCSVQo
MjQpIG1lYW5zLiBJZg0KPiA+IHRoZXJlJ3Mgc29tZSBjb250ZXh0LCB0aGVuIHlvdSBjYW4gcmVm
YWN0b3IgdGhlDQo+ID4gZHdjM19vY3Rlb25fY29uZmlnX2dwaW8oKSBhcyBiZWxvdzoNCj4gDQo+
IENvbnRleHQgaXMgYSBiaXQgc2NhcnkgYW5kIHBlcmhhcHMgY291bGQgYmUgZG9jdW1lbnRlZCBh
cyBkZXNjcmliZWQgbGF0ZXIuDQo+IA0KPiA+IGR3YzNfb2N0ZW9uX2NvbmZpZ19ncGlvKHBvd2Vy
X2dwaW8sIGlzX2JpdDI0KSB3aGVyZSAiaXNfYml0MjQiIGlzIHNvbWUNCj4gPiBvdGhlciBtZWFu
aW5nZnVsIGJvb2xlYW4gbmFtZS4NCj4gDQo+IEFzIHRoZXJlIGlzIG5vIHBpbmN0cmwgZHJpdmVy
IGZvciBvY3Rlb24sIGNvbmZpZ3VyYXRpb24gaXMgZG9uZSBoZXJlLg0KPiBUaGVyZSBhcmUgdHdv
IFVDVExzOiBhdCAweDExODAwNjgwMDAwMDAgYW5kIHNlY29uZCBhdCAweDExODAwNjkwMDAwMDAu
DQo+IFdlIGFyZSBqdXN0IHVzaW5nIGJpdCAyNCB0byBkaXN0aWd1aXNoIGJldHdlZW4gdGhlbS4g
Tm8gbWF0dGVyIGhvdyB5b3UNCg0KVGhpcyBpcyB0aGUgY29udGV4dCBJIHdhbnRlZCB0byBjaGVj
ayBhcyBpdCdzIG5vdCBvYnZpb3VzIGZyb20gdGhlDQpvcmlnaW5hbCBjb2RlLg0KDQo+IHJld3Jp
dGUgdGhpcyBmdW5jdGlvbiwgaXQgaXMgc3RpbGwgaG9ycmlibGUgaGFjayBhbmQgbWFraW5nIGl0
ICJuaWNlIg0KPiBkb2VzIG5vdCBzb2x2ZSBhbnl0aGluZy4gRm9yIHRoYXQgcmVhc29uIEkgc3Rp
Y2sgd2l0aCBvcmlnaW5hbCBjb2RlIGFzDQo+IHRoZXJlIGlzIG5vIHBvaW50IHRvdWNoaW5nIGFu
eXRoaW5nIHRoYXQganVzdCBzaG91bGQgbm90IGV4aXN0Lg0KDQpJZiB5b3Ugd2VyZSBhYmxlIHRv
IGV4cGxhaW4gaXQgdG8gbWUsIEkgdGhpbmsgaXQncyBub3QgaW1wb3NzaWJsZSB0bw0KbWFrZSB0
aGlzIGNsZWFyZXIgaW4gdGhlIGNvZGUvZG9jdW1lbnQuIEJ1dCB3ZSBjYW4gbGVhdmUgdGhhdCBm
b3IgdGhlDQpmdXR1cmUuDQoNCj4gDQo+IE9uY2UgT2N0ZW9uIGdldHMgaXRzIHBpbmN0bHIgZHJp
dmVyLCB0aGlzIGZ1bmN0aW9uIHdpbGwgZGlzYXBlYXINCj4gYWx0b2dldGhlci4gVGhlIHZlcnkg
c2FtZSBpcyB0cnVlIGZvciBjbG9jayBwYXJzaW5nIC0gdGhlcmUgaXMgbm8gY2xrIGFwaS4NCj4g
DQo+IEJ1dCBub3RlIHRoYXQgbWlnaHQgYXMgd2VsbCBuZXZlciBoYXBwZW4gYXMgZG9jdW1lbnRh
dGlvbiBpcyB1bmRlciBOREENCj4gYW5kIEkgaGF2ZSBpdCBvbmx5IGZvciBzaW5nbGUgU29DIGFz
IHdlbGwgYXMgSSBoYXZlIG9ubHkgc2luZ2xlIFNvQw0KPiBhdmFpbGFibGUgZm9yIHRlc3Rpbmcs
IHNvIGl0IGlzIHF1aXRlIGhhcmQgdG8gd3JpdGUgcHJvcGVyIGRyaXZlcnMNCj4gd2l0aG91dCBi
cmVha2luZyBhbnl0aGluZy4NCj4gDQo+IEFueXdheSwgd2hhdCBhYm91dCBqdXN0IHBhc3Npbmcg
b2N0ZW9uIGludG8gZHdjM19vY3Rlb25fY29uZmlnX2dwaW8NCj4gYW5kIHVzZSBhbGwgdGhhdCBk
aXJ0eSBtYWdpYyBpbnNpZGUuIFdvdWxkIHRoYXQgd29yayB3b3JrIGZvciB5b3U/DQo+IA0KDQpG
b3IgdGhpcyBzZXJpZXMsIHdlIGNhbiB0YWtlIGluIHRoZSBvcmlnaW5hbCBjb2RlIGFzIHRoZXkg
YXJlIG1vcmUgYWJvdXQNCm1vdmluZyB0aGUgY29kZS4NCg0KVGhhbmtzLA0KVGhpbmg=
