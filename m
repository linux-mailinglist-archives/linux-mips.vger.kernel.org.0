Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 631B276A5B5
	for <lists+linux-mips@lfdr.de>; Tue,  1 Aug 2023 02:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbjHAApW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 20:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjHAApV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 20:45:21 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8643B199E;
        Mon, 31 Jul 2023 17:45:20 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36VJq7h1028561;
        Mon, 31 Jul 2023 17:45:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=nZ2UMWYz0JstOVRRdeV+NuCin1O6piEIHf8MU5u1BTM=;
 b=VJKtmZlrCiH2aZIYlNtYGdAXNZPs2Hv6P0ytIAB4tra7qIXKy393JKp6RDMBnDjRritb
 39Q88gQJJzyISfovkLhzc9qrSHvIlUI33g/90mIoVO1IOqHU5mKWbiqZqtEO99wO8dd3
 vwVG1GbpilLE9gI4xWDZ6kYQ2uUZT9x+s58aMY85XtvkDtfbgbOLpbAbvefSXr0wDl/p
 hh8gJadLFKB96khUrTkKE9AOiK+ZAIfoPTt1bNtGZGAvAyxoLHkaoRuf82LW5A3wa8Nm
 h0Yhuz36sziX91jVdZ91poLl7GvbiGY4Tde+/A3PgEvykrJXOzq1L95PMAAKRRrAjIMD cw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3s51dcsx4t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 31 Jul 2023 17:45:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1690850712; bh=nZ2UMWYz0JstOVRRdeV+NuCin1O6piEIHf8MU5u1BTM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=WkAdlSWUsG9X9W51TuLw0egfw0gmMf8Hap9H5L6wi4euXONtlBIkk5NxN7UIEMDAj
         ROJbXdsfS029cb5LvgO3thhwryANdV5TwCrVMYr0wMgTeuvYVJkTDvxwEs1cJDBiEK
         6HAQvX3CwFlKS0nzzapTjpg2Bq5dXb8pEBZ/ehLw3A6onsXaThSzK6Yq0iG3l8ui0D
         ljfVP0yli9Jac/WMpjthl/E6SIAZHwxY+idvwgl6nsiOkGIdR7lgo25xwKAoeMRjK3
         JgE6haKQmHVMX1af8IpzpsyRKJbSDXgITb0+77IdNx8j+2GdIx4OoyfIoQMeUlXwcQ
         3ZEXjm9pfUSVg==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 313BC40565;
        Tue,  1 Aug 2023 00:45:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 845AFA008D;
        Tue,  1 Aug 2023 00:45:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=XamoAoqv;
        dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id E8DF040218;
        Tue,  1 Aug 2023 00:45:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k95CW2k7gAbMSref2Ehg2Op0NjJaDGNWSMLyCTOCkPEJn2P2mJshbT+GTpT2y9kLT+KAb0JWk96gswL05uVnjYZtVIPkhcfzhZ8Rmi66jZ980u69epsN+q96014c6XxBUQKZoliHSFUrBUB90/kQLcFIFybEGQXsUzrgJgDzm+44pW+HtMSC0f1cskKs2nggmigJjRXHlry9gXDzcV9gS5FkH7DIbgegrA2+zJUoZ5cZDcKuHzqaqhBc0IukQb4aCbc7gL76vwl2xl+Dg9VHek8PGMJEa1DgP8Io9JupAzBIKwcnELHO0vEaE6Jy9Y0EPPKCZ/ck86LafOw8hRzpYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZ2UMWYz0JstOVRRdeV+NuCin1O6piEIHf8MU5u1BTM=;
 b=WPw3xG4f+DD6Vu65im36BgsyizDZLlaUg62qVNuJtF9ULWhvW/2HJjsdPqlmNVv4ePVVmKHXVR2NvEjTKsW60hZxMfCcU6HMKegFX7YyvwjY/IMBVBYRW9vAmq2RmZwdB2OR4F9H3tYeZNO3fL4GVfdpN7z/FM9/0/avJTkdN5kvgvec+cXKmITicmgkbSV1WzYY6/TR6WK0R/FbvYqa0QhCqySlZ5oOpYsRv1/pZQscFLBA0LHW1U0h/BQH/Z/iP0M8SF9fY4NrwuvE5oOG9Ku6fPXV0ixEzxzXDsocgZlj48lH0b622yApqO7Snvia4ZzK2D3w6hY0CWiNEqN9zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZ2UMWYz0JstOVRRdeV+NuCin1O6piEIHf8MU5u1BTM=;
 b=XamoAoqvBaqqPvSzVWHTgo+fjWzyKhA/q/K1zF5tJhKPH0PEXv/eXsCfo35tORseAZbnFPupCEy4AQdzcfjElddJMnDAvEIOalASXdEaEdGuHbS7Glao03rGV9pvccKurfIQ4Ew2+0vEN9gjisUJXy3NdqtS0k90WWtad0nidG0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SA3PR12MB7904.namprd12.prod.outlook.com (2603:10b6:806:320::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Tue, 1 Aug
 2023 00:45:02 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33%5]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 00:45:02 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 7/7] usb: dwc3: dwc3-octeon: Add SPDX header and
 copyright
Thread-Topic: [PATCH v5 7/7] usb: dwc3: dwc3-octeon: Add SPDX header and
 copyright
Thread-Index: AQHZw5IhVpoTVWkHMEGmxsLvPHH7K6/Um6qA
Date:   Tue, 1 Aug 2023 00:45:02 +0000
Message-ID: <20230801004501.2yvjfxr3lxnb4ywv@synopsys.com>
References: <ZMd/HzISn0mPsNWt@lenoch> <ZMeAAYx6Z3hlQBNQ@lenoch>
In-Reply-To: <ZMeAAYx6Z3hlQBNQ@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SA3PR12MB7904:EE_
x-ms-office365-filtering-correlation-id: ed9a05a3-1f2c-4091-6b40-08db92288ac6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EXgirP9646/RKaGwpeyS8o0462M6impAAFaTcAMA1ORWBvJcuBD9C9xuv2v+dOgrI04HFiDpvVzmMgPpp8aW9N/2cIGWU10S6Dr/cdRE9Ck1iSOHwCPM2qZIN6WSfcm6bQSgr4tfriBnuDk6nwmpj7yeSaJzXfrP8XnJ9WvutCU/Wcwelzx/hJ0LlGzRqIoxtDERlK02LDVesYcEz5HNDlPhatO8mw8ECnImmeg8xS7+dMWr1BTyyYw/tdGz4DuqmwH0zsNsZKk2o1qRgbkOHD+AvCVtZXRyqnQEIPosx/7yM1607sKUEMntHJJSvtQt2YcLfcrwDk++WCi0i/6YX5G1iIQbOW1b1pbl/emnxX+Tl9gHcMwNuoj2sWsUKEG2LEjdN8wMHmsiiLOIKuq39EnY5a42nqng+IMe+1ZzayaRRAgKARByIkbIK3KuYdv8dvQWR8emDFERYskBo+Dt3hHurfubMRfEiMa51sCOBsPCpO4rLyE8DO4eIVBO1bEG3SKKQBRw6lWngGZxwnOCiP+ApuTDUAuH/2FuZ3bF2aGtdYvb/7R7Bpqf5KqXVBe2hM2VUp2MooShVg7OYceYK5oTWkkcHIGYVBYXx2aegd4eAizeEsBDFlMnuROnrVpc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(6512007)(6486002)(36756003)(2616005)(6506007)(26005)(1076003)(83380400001)(186003)(76116006)(66946007)(66556008)(54906003)(122000001)(38070700005)(41300700001)(38100700002)(86362001)(66476007)(316002)(5660300002)(66446008)(6916009)(4326008)(8676002)(8936002)(64756008)(2906002)(71200400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alBOYzhudzVibEpuU3VvdW05azh2MWNUMDZPTEJ2T3JKUmVWN0dJTWRkMVp0?=
 =?utf-8?B?ZkNsSDZvVVJmeHZHbjAwb0ZpdC80QTIrYUVSaDdoL0ZqbjdUWFdrYlpyRkpJ?=
 =?utf-8?B?dTRlcmZ4am5oYjdOWkVwV1JNaVhNbmZqRkx1bnArdURZcXloRzFKSzNjdHlv?=
 =?utf-8?B?dUNIeXp3TjI5QUV2RjBEUjVrOWdVOU5wMld2WTdUZGJERmwyemxBaFlzRGRk?=
 =?utf-8?B?NmJnTlFFWC9jWFdaVHBLTmJabktBNUFaMEVEc0o0YnFxK2dxcmh2Q3Q1MHI0?=
 =?utf-8?B?ZTYyV2tNT1l2RnYvdjAvMTJxZ0RXU3F1K0t5cURzZTRvOXpvQTc1NlJHRVdP?=
 =?utf-8?B?VFdzT2FUVlBEZllZY2MrdXRnNEVtTVNoN0hIS1dzTnVTRjdBSk5qOCtsZ2lo?=
 =?utf-8?B?emFsU3FielZaQWtSdUxlR1ltQ05SVCt0UGdheUE0ekViN1owRHl6aG4wNEJ5?=
 =?utf-8?B?N2N4dGhYSk9tbkVBWUtxam5FM2dFVUhTdVMzWjdJMGhMRnE3ZkQ0NXVYYnNI?=
 =?utf-8?B?dXRUWHlmNjlIZHFzWFhXbEF4U3VreisvOXlKUlRWb2FTb21UWG45ZUp1MW9S?=
 =?utf-8?B?UTIrT24vL3FxcjRpZHN6V01WQVNaN0VkTGtnRnV4YXBJYjB1bGdwR0d5V0FZ?=
 =?utf-8?B?UlUzNERqa0g1TXcydTJYYnZjbnNKbHVESnhkZzczMThpejJNMStYSUZYanhT?=
 =?utf-8?B?TFAyNHhOOWtCSndYakN4bFd3RzltTVVYWE9FQjR6cWFVZVVwSWxsdHBFc2lv?=
 =?utf-8?B?S3VpVWhaNEM2cFlFdm1qbVFiTWxUeXpJVHAxOHpzaWl5aGZ0QndMS29qcXNV?=
 =?utf-8?B?Z3VPWGdmeXlLNWVMZEx3bnc4VGFNSmJqczRpR0JkbzU3ZW80WVgzTkVoVkFE?=
 =?utf-8?B?ejU4TU9tb3ZYQ0lQWW53MXZXNXdDT2tqekJjWGxaSzFyWnpTV1JXZ3VXWC9i?=
 =?utf-8?B?THJVRUdwMUdFNkxLNzFYZytmRXZ3aS9zclU1WG9nU0ZYRmRRd1dKSmQzM1pq?=
 =?utf-8?B?K094dG4zQUNxcUVadXRxMEc4eXh6NWJnQjk2K25uU3lNb3hzWUpYWUR1ZjZw?=
 =?utf-8?B?V3Q5aUJkZkVyK2UwL1EwVVk4eEN1UWl5dmVGUWREejlBaXpFemdyU0E2SVRL?=
 =?utf-8?B?eUFQbk9ySysvR0xYc1RjZTJvWGliMXdZQSt3RmNEVmRNb2pJeWtIUWtRTWYr?=
 =?utf-8?B?YmhQZ0VnbDRGVkNWNnRHN29wb2ZmZlB0WHJmbE1UcmlqcFoxYS9vV0VHUUxI?=
 =?utf-8?B?L0pPSWVZcFFWdVlGdnYrL0VreS9YRm1mbnJaR2JvV251UzNHM2h3K0xJYTBi?=
 =?utf-8?B?V1N0MWVzelBoazB0c3QveDBBNm5uVStJNHhRcHBTcmZTQk1oYkIwdGk0bmNO?=
 =?utf-8?B?dGxUd0t2MXZBRllZYzBvWVcwVkpUTUdMMDdaQzhZSmFVdVpWUlBtSVMvNlpp?=
 =?utf-8?B?T0ZhQitldWx6bWU3TVZwanplTXlTU1NiTitGeTlkdEdobE9OTXgwRVZOZEhn?=
 =?utf-8?B?KysvZ1EzSXNBNzBKZ2hFbGVaN2FOaS9oYStOUmdhTEt1UXlFdEtLT1ozcWlQ?=
 =?utf-8?B?QUJ4dDNNaXhDMEpJZTJUK2RQNW81Ti9teElBSGNaWTNkLzczTElnL0VHNkRv?=
 =?utf-8?B?N3QvbEQ5OENjUFczYXoyUExGWlFGdjFJL2wwWlBzbytzMG1LWW5MRE9oUlRz?=
 =?utf-8?B?dGlkODhqOFN2TFhyQ0dSMzRZTG1TUk5hNVp5cjY2RThHcURBN3dBN2NPSUhl?=
 =?utf-8?B?ckVhSnJuOXBxQXVQYXJzZGg2NDVNL00wSTRWQkVzMjM4MEd6TmZxVFkwelph?=
 =?utf-8?B?b2piZ3lkcUV1T1JMaGI3ZHBWcTlBRlFtRzVVOEhrckNSWmtvWko0eXp6QmM4?=
 =?utf-8?B?RGVEeDJhYWdCcUtiSGpseW0xT3hPcUlnakFsaTdkOUFxNDBZcDhBYnJsVEFj?=
 =?utf-8?B?K3pjN0c1c3JYZkRUczRTekxlZ1UwWGN5ZUxCMzJoUll1RzdzMTEranI0VlAz?=
 =?utf-8?B?NmxrU1pnSnVIbTJ3SlBzN1hqTm5nQ1NYWW5uUDFHcXY0ZU5qUUUvV2swYWI4?=
 =?utf-8?B?c0toSFdwU0N4K0FlQUpyRUVPUktXL2lXT2pBVHZkMEh0aWFLVUFjald2MnRF?=
 =?utf-8?B?eVBYVm0ySnNiclVsc2JobjhxdXJKOUZ4T1hXR0FHK0NJc0cvencwRmZDY3Ur?=
 =?utf-8?B?Smc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4F1C76AFFDF5147A77CB0FE0A3E19BA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?cSsyRjJEb3IxUkIvR3dkNDR2VFZHRHU5cVFHbElPTm5GeVVjMGVtQnRhakZ4?=
 =?utf-8?B?TzA5L0pPTWlBSHp4M1lyU1JYeU85bUZFcTU3VkUyZW4wZ25WcHVQQTQ0YnRF?=
 =?utf-8?B?ZG1kVnZvRjl1NTZiaTh6c3Zhd0xOTC9Jb1lwSTR5aDUzZkhUR3hQMFY3Y2sw?=
 =?utf-8?B?ZHA0Q1JNRTdVcXNYN3d0TnBnTnNRVDZ3N3NqcUtKOFlYNGNpS2ZmbTBHSlFl?=
 =?utf-8?B?RFcranBGOE9MTlNqd2RSRm84dld5amFxbis2UllLK1FIVGZoK2J2M0ZYcndJ?=
 =?utf-8?B?bmh0ZmNIM2N3V3BjcE9QVmczRFdZTGVKd09OaEdaaGtEQ1YyYy80a3B2alEx?=
 =?utf-8?B?NzlSMnhEM1dxNnBHR05MSlpUZ1JLNTVyOUdwQ2licGRoRHZYNkwwWXkyWE9S?=
 =?utf-8?B?a1R6RkNSYm9GOWVKWHllTktyTWY4S3Y2LytnWmtqMTdMRlV6ek5vSm1uenJY?=
 =?utf-8?B?Tk9Yc0ZKNUtHWTZwVEIvK09iLytBU29vYjhrc3dML2tyOWVNMFhxaTRYM0JM?=
 =?utf-8?B?MEczYjlwSEQ4VDhCSldiRnRaQ2hWYldBeUNKMm9SZ3VudnBSY3o0R3doQ25y?=
 =?utf-8?B?aXV1d2lsWEJ4VDFnQ2d3anVJbVJhOTdMckdrN094eHN0a1lHYnFwQ3hiTTlN?=
 =?utf-8?B?QzNva3l3QUQ1NEdQOUNXNmc1cGtDTVZjY0VYYWVicXFOV0tCbFpNY2kxWHRI?=
 =?utf-8?B?NFAzVExPR1JSS1FqRjZFOFJRUFpHNDJlS0diWStCbnJqSGRYNXBkMjM0dElw?=
 =?utf-8?B?M0xjSERINkRZazJVUFRVRHkrMGxpbkJFSTdLZDdvVS9sOE05U2V6NHNNTjQz?=
 =?utf-8?B?NUtBZ3Z6MW5LWFF2dDc3aDhPYWVBLytSeEdCT2dPWjdkTUlDY2FhTHA2UWVj?=
 =?utf-8?B?bm5ySk0vZUh6TFlwN3ROUGQ1RTd5K3A3UGhwa1FiaVRZb2NaQjdCemdxS2Jz?=
 =?utf-8?B?c0ttVGp0RlVNYjNraDI1dG9lNE5ud2NZRENyVytVaWYxaklRR0Q2N0ZqRHl6?=
 =?utf-8?B?SGFhRkNwYzZPYUJtTHk0VzNRRjNCR3piZS8wa1BkVVh5SE4vdUp3R0c3Nis4?=
 =?utf-8?B?Z1V3YUF1V1daREZXSEcvRldLNnA3STVQUXUyZ3pUZ0tVU3JibHpIaFdVN1Fw?=
 =?utf-8?B?RW5qT3FYenhYS0xxdzF3cXNnbnd6VWdzQitjczZPZm4rTW9icEVyMjR6ME5s?=
 =?utf-8?B?bi9uQXVqbE5tWnpsbDlsTGhDY0lCU1djN2RFVU94ZWN1cVBLcmQ2TVBpUG5w?=
 =?utf-8?Q?4/rbbFy0aRObNcB?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9a05a3-1f2c-4091-6b40-08db92288ac6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 00:45:02.7299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cCudyTqdssSBtht8rFq01fKx6wWpBHOziz2kjV/M8jwi/W6iB1f/8MKMpYLkG9bkRqg5LAzlobmlcs3JJWdfcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7904
X-Proofpoint-GUID: dO1XlJr_69vQTXs38uBLdpBaOmn5SDU9
X-Proofpoint-ORIG-GUID: dO1XlJr_69vQTXs38uBLdpBaOmn5SDU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_17,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308010005
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gTW9uLCBKdWwgMzEsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBGcm9tOiBMYWRp
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBBc3NpZ24gY29weXJpZ2h0
IHRvIGluZGljYXRlIGRyaXZlciByZXdyaXRlIGlzIGRvbmUgZm9yIFJBQ09NIHMuci5vLg0KPiBB
cyBEYXZpZCBubyBsb25nZXIgd29ya3MgZm9yIE1hcnZlbGwgKENhdml1bSksIEknbSB0byBibGFt
ZSBmb3IgYnJlYWthZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMYWRpc2xhdiBNaWNobCA8bGFk
aXNAbGludXgtbWlwcy5vcmc+DQo+IC0tLQ0KPiAgQ0hBTkdFUzoNCj4gIC0gdjI6IE5vbmUNCj4g
IC0gdjM6IE5vbmUNCj4gIC0gdjQ6IEFzc2lnbiBjb3B5cmluZyB0byBSQUNPTSBzLnIuby4sIE3D
rXJvdsOhIDEyODMsIE5vdsOpIE3Em3N0byBuYSBNb3JhdsSbDQo+ICAtIHY1OiBOb25lDQo+IA0K
PiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jIHwgMTAgKysrKy0tLS0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMgYi9kcml2ZXJzL3VzYi9kd2Mz
L2R3YzMtb2N0ZW9uLmMNCj4gaW5kZXggZDU3ODExMGY3YWZiLi42ZjQ3MjYyYTExN2EgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4gQEAgLTEsMTEgKzEsOSBAQA0KPiArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gIC8qDQo+IC0gKiBYSENJIEhDRCBnbHVlIGZv
ciBDYXZpdW0gT2N0ZW9uIElJSSBTT0NzLg0KPiArICogRFdDMyBnbHVlIGZvciBDYXZpdW0gT2N0
ZW9uIElJSSBTT0NzLg0KPiAgICoNCj4gICAqIENvcHlyaWdodCAoQykgMjAxMC0yMDE3IENhdml1
bSBOZXR3b3Jrcw0KPiAtICoNCj4gLSAqIFRoaXMgZmlsZSBpcyBzdWJqZWN0IHRvIHRoZSB0ZXJt
cyBhbmQgY29uZGl0aW9ucyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljDQo+IC0gKiBMaWNlbnNl
LiAgU2VlIHRoZSBmaWxlICJDT1BZSU5HIiBpbiB0aGUgbWFpbiBkaXJlY3Rvcnkgb2YgdGhpcyBh
cmNoaXZlDQo+IC0gKiBmb3IgbW9yZSBkZXRhaWxzLg0KPiArICogQ29weXJpZ2h0IChDKSAyMDIz
IFJBQ09NIHMuci5vLg0KPiAgICovDQo+ICANCj4gICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5o
Pg0KPiBAQCAtNTM3LDYgKzUzNSw2IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGR3
YzNfb2N0ZW9uX2RyaXZlciA9IHsNCj4gIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZHdjM19vY3Rl
b25fZHJpdmVyKTsNCj4gIA0KPiAgTU9EVUxFX0FMSUFTKCJwbGF0Zm9ybTpkd2MzLW9jdGVvbiIp
Ow0KPiAtTU9EVUxFX0FVVEhPUigiRGF2aWQgRGFuZXkgPGRhdmlkLmRhbmV5QGNhdml1bS5jb20+
Iik7DQo+ICtNT0RVTEVfQVVUSE9SKCJMYWRpc2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5v
cmc+Iik7DQo+ICBNT0RVTEVfTElDRU5TRSgiR1BMIik7DQo+ICBNT0RVTEVfREVTQ1JJUFRJT04o
IkRlc2lnbldhcmUgVVNCMyBPQ1RFT04gSUlJIEdsdWUgTGF5ZXIiKTsNCj4gLS0gDQo+IDIuMzku
Mg0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNv
bT4NCg0KVGhhbmtzLA0KVGhpbmg=
