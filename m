Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBCB673EF1A
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jun 2023 01:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjFZXSN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Jun 2023 19:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjFZXSM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Jun 2023 19:18:12 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BCEFB;
        Mon, 26 Jun 2023 16:18:10 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QNAsDY001541;
        Mon, 26 Jun 2023 16:18:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=1CuA88ZOULnVIbHqPiorwbS70ooEhdR4WCF9INBfU3s=;
 b=mwO7WPst9tmEcEDFDHZsTI8a8lLnIZ8hqJh2Ffq9sJYDBAh7Mt5kPBKZmL49GjLAXia+
 7E2aHrYVOUSClRU8QicMAZStEhyqMsMYf4bjuMzmXb/s2CFfxoLmptdhR3REW0bDIU5z
 HddbBB6jBjyaxH2HGSq/bkafpd0et+uZmbbTBvIhLXELiKrJtz/GLzFS+dcdM9MAKalr
 DhXzodYHIWykhBfREqfcTtSkmokOmwVSz6w1k+l3kUY6gVMBtpSwV6xs+z/I5Bf0zbHt
 mHr/sCxq1wXEPYse0CuZEh48r9ylvLC3D23koaRWdzpheCBjAOgm9R9s4G4IK1j+Tn9o vQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3rdy4e3cve-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 26 Jun 2023 16:18:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1687821484; bh=1CuA88ZOULnVIbHqPiorwbS70ooEhdR4WCF9INBfU3s=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=cNraBcC4GaCDPSAiQk7m1SAyutvjjaMcqgz7XZAYAOgdw63lUNJ3LmGjXSNlOp/uZ
         xHyzSkwqE3RmRJLjn+TZwWvr7xqJRHfXetja+Mrcfn7MtHQHqX2I0hiu5YlzCxLiI6
         g9x9t+jxatZoR3drv3zXf8Qv3vhNGD9LyEKgXxUllKWHMVUOokEmc5khIICAbjairl
         5usDg0i1ue11HBx93U9gI3OIUtmSrOx7SAn6UvGqCsn8dg+vVK1TCGbnbK0wV5s0fJ
         XsyLPz9LKinrfX5cLlTnJCtXX9R5iSiBi5yi6EjtXOItVPRH9cZ1E3Q0Cf54ztFoWV
         oG+X2lDo75ytQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 49D5140236;
        Mon, 26 Jun 2023 23:18:03 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id BB583A0071;
        Mon, 26 Jun 2023 23:18:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pr2DZhbw;
        dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 82CD34013C;
        Mon, 26 Jun 2023 23:18:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGR96KSkKEIosFoRnJF7giIJftQqvs9iibiXQz4tRoSTez2YpOZaa+0hY0uHhuBQN/lSHGfn437dltXpR2gm7w1kwQEJfPHVx41DwXxQxsSZHOH14JIL/OOWGIqRa48l7OBAelRgCIi/84xyLg8wqeywfN845q8t1ZSnWp359X+4tZm8wFAHNZfwP59/EhFkh517/37YSBqmG6CODaKZYXssY1ZLIsUMXAad+u0vamehZv06y+F6neTNTMFTCNanKthRKaRYOqvhYqQVWjMqe8a2Xu9fns0mL9+6sdL8W2FPfMtZdS98tuK4MMwj81+flqnk1RPPGr0xsdW8FBk0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CuA88ZOULnVIbHqPiorwbS70ooEhdR4WCF9INBfU3s=;
 b=e5q2kUm3nMEqHX6EQvxQI+3aYL+unFP5COP9ilPwKWzJbEXjJlwVrx+BXWufqxxsAruBAokjVVD1jA5ZuJtMG/cSef6nBYuUA3xm27O9KAMZ0yvZTxxJ1MwEiY30lYUEktCsqf9ir+zXO2dSgdgHVo7oSuSSOvNSul5Lh8EnPkZWm/2m+TD0i1yTHKLVDtPyxYY2dgL8Th6AaVxt1cH43f5plKs5ajqRP5Todpdo/Gqxcerp/KTVV77eCcX6nB8ibGC4iG5i1tvOsXoZhin2e8YJ/4MqndicjXpjgx8KojTmcItc6W6AJ+ZCgbSWRm0+IvdQGtKrtOJIFaM5tZ0F3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CuA88ZOULnVIbHqPiorwbS70ooEhdR4WCF9INBfU3s=;
 b=pr2DZhbwy/A034eF0SDsOo4YREmNDJaNxNP39xxg+MJyzhZS8L/WPA/PeiQ0PUWnMUpAntgDPlCOzW/bPeE0NMgI0oK5iB/KU5Ic5mJWlQjabVJgmTI8pR3PUI+re+LSRlKSzHtUfv5Me8wIzbKQEgh39HndikS+/gXq9OnXLxo=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MN2PR12MB4503.namprd12.prod.outlook.com (2603:10b6:208:264::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 23:17:57 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b%3]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 23:17:57 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 00/11] Cleanup Octeon DWC3 glue code
Thread-Topic: [PATCH 00/11] Cleanup Octeon DWC3 glue code
Thread-Index: AQHZoun2p3xHm/wYXk2RPs2fSTogha+XdTiAgACVkICAAQMQAIAA5RYAgAPQG4A=
Date:   Mon, 26 Jun 2023 23:17:57 +0000
Message-ID: <20230626231753.jumwoztg464q5656@synopsys.com>
References: <ZJC165p0Mj4jHcBh@lenoch>
 <20230622230149.4wpvtlpsu7473txr@synopsys.com> <ZJVQUzVW+NzCgH7i@lenoch>
 <20230623232420.vfvkqkcee5jrrkmo@synopsys.com> <ZJbp0P5fYkvTLN5g@lenoch>
In-Reply-To: <ZJbp0P5fYkvTLN5g@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MN2PR12MB4503:EE_
x-ms-office365-filtering-correlation-id: a03f9dae-140f-41bc-612d-08db769b93be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zrsmjIot5tfJYJApJC6g1vW2v+7LKYmdr6J1KERZR0xG/lC9wVs1db2BWCYCHZwexLJxwKmtmzVSkCYWKyB4svK531V5g0sg5KFxiK/1lguP+5aub85tiAkbTtgh3V9+CY7koXxu2qKhd1ciX2WaLpPjyP6ybRzlcb0l6rRtzCFs+bTYIonqodDEWZBOAfxBRGhM8LO8ZDdaT7frkx9REN5wvWAyfiEJDBthZQDGAG3OfPIv1oGggEPc6j7UrYP+SGVftIQSY0S85UZUh0lZwR+lHVFST6D8AqRZ/aX5Q69KH1uETxM7ZU8vhUGK+FOQ/hsi9b7x6dS/rQFRgND0zwHVA9+ZTIT24o4smKKKwu9d9cTaW3ADfo23cI3fq1WxNy8kQFrbnVLZN4GqxlYb7pG3+mkSC7PD4S6TbfjUo+HlbvK05S6AjEB1LUrSf3E2gNc1MSAX3ox5xglks/7WOhjkhi5QwB8vg1LBxY3+8V4abEwDSEI78s9MLB58OV/WmRLUENz4IrIL3zjwcyjJew0gCPX/8LeXtHMl3n5ofCUQ793uOJAhA9GEcKHz5C521d+7nj6Xe4ikz6rrL+JLMfI90T7BdY7bal10QEG9SRiPHMLf7hcqV/53Um9Lf/qS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199021)(36756003)(6506007)(66476007)(5660300002)(316002)(86362001)(4326008)(6916009)(8676002)(41300700001)(8936002)(38070700005)(64756008)(66446008)(66556008)(76116006)(38100700002)(122000001)(66946007)(6486002)(6512007)(1076003)(26005)(2906002)(186003)(71200400001)(478600001)(83380400001)(54906003)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3o3NVFySithcVpxeDBjZXpaZVd6dlZxbFV4UkRJSTJYbW1WVVZDODlQM3Y0?=
 =?utf-8?B?eTFmL2hHYitJcnZFRnA5OW5oTWNuQ2E4dk5SQklQb3ptTkxQdU51UHo3TGkv?=
 =?utf-8?B?YjByU1BoUUNpVGZMRWhqQ2lQY0I2bnQ0S3BhczBNUFVpMWpIeHRUMXdYR0ZN?=
 =?utf-8?B?L3QxS21TMXB6WEJoZXMyZUZMLzdkaWpIdGZ3d1hOeERBUllNOW5yTGQ1MHI4?=
 =?utf-8?B?VGpCTytVVUJPL3EvS3oreUtuKzQwODRhMU13UVVjMkk4SWE1QTI2RXhDeGtM?=
 =?utf-8?B?dGtESlVoV0VEMUROS1ljUlRvMndSeDlvcFI0ZDVsNW05T1RLTFgxVlMrY1Nk?=
 =?utf-8?B?SkpCbW1PU2tQN2Z2Vm9NNS9xc3dpNnRyYWFaUHpCcXR6RTNHTFBHd2t1UXV0?=
 =?utf-8?B?NkF0V1dENTFBbnVZUFhWTktSZnorUTcwalhKdDI2Ylp3RnEvT2tzS2xrSzgr?=
 =?utf-8?B?d3FDVEFZaTc2aXpuY3p6emo2b2FJMXJEb01melloVExYK1hqYXdWeXpxUkxL?=
 =?utf-8?B?SDVNdmx5am0zTlhKMVFHaHNFQ2diWFk4VkNzWjVOS0lhb1hSZnJXeUEvb2VG?=
 =?utf-8?B?R2hLRHlOdkdQaW5aYm5NOHQrTjVzb1czcVhuSHFVbUtlS3VBUUl3eWhNSlNu?=
 =?utf-8?B?eXVmQkNMbUx1KzJDSlVRYytRTEw2Ykg4WkkwMkhJR0htRHE2VTdHNFhVR0tu?=
 =?utf-8?B?VlZMQTJ0Rzl6MGF0ZTR3NVN0VmNoOHZIQ1prcHlCbWYzbGg2VG5UV3V5bTcz?=
 =?utf-8?B?MkdCOG90TmdsSlk0NlY4bTRudFpBQ1FXS0VLQWxnTlpkcUd2Vm5pVHlIVFVX?=
 =?utf-8?B?TjlleUpseWtMemh4L1BBNGFiVW45MEZnTUFJY0hiakdjSWxYRFRwQ0ZZcVdi?=
 =?utf-8?B?R21YNmdLUS9ncGVPRUdBRkhiNEpjZGJoVWhjbWloaVBKZUNvb1hmcmZCWUlC?=
 =?utf-8?B?Q3V2SW1MelJOSUIxNXNZZDVaSDFmbXAzTXdrWkFHS1RDc3VneGRmU2VwcUdj?=
 =?utf-8?B?R0dyRHhKeGpPaVlsMEtXai9Ma3dQdEs5ZVMzaHRVcnFDWWFORXRtQU93dXhX?=
 =?utf-8?B?L2kyZFhEdDZOWjRxc2MyQ2Y3WEFoNldUYTNoQXpDUmhkbkM2aUY5RmoxTGpE?=
 =?utf-8?B?RDAwMThWOFBCWEpzeTFrcTljQS8rUGNKQ3lsd3FvTzI4SWJnc3BnTFNCTmlU?=
 =?utf-8?B?UFEyK1pMV3ZQbzZld09UNTBXY0NRWmZzWll4MFhuWG1GNm5nVmQ0dS95dlRu?=
 =?utf-8?B?T21EMENyRVBzQlE1YUFSbUpNUG1yanppdWduSUdBQzd5RjlUMmxZdjAzcFUx?=
 =?utf-8?B?NEkvR3hHbVN2eXloU1ZRakcvSGtpMnZ0eXg4M3hONVVZYm5oaGs1TWV4emdP?=
 =?utf-8?B?enU2Z2phSmhUS3E3T2ljdlNkTEVWY1BFenRUcTlCSjFkb2xlc0taYWZYdkVM?=
 =?utf-8?B?Ni80KzFBUDhKcUdOUVYxZWVSQWplUjJSTHovaFJVSFlWSTlYU29EVThLQUVx?=
 =?utf-8?B?aHZJWUR6NDVaRFowRUpKZVQxb3JScllUMk5MRFhWamdYMXBEZDQzTEMxMEM5?=
 =?utf-8?B?RGRONzlLTTN4TEJoSnA1Z0pyV3FVTk5MWDVGQ3RReUJZM1hpSVRxSlBaOUJ0?=
 =?utf-8?B?SHI4OS8xc3J5Ryt3ZzEyaXREQ1d5akdwUW5ZWUhpK1FhbjdHcVkvdFk5VTEx?=
 =?utf-8?B?bE00UThmYlpLaUdndm9kLzBmeHhacWd4eGJ2Wnlsc2p3M0x0Y2ZydCtOY1Mr?=
 =?utf-8?B?aTJyNjl6NGN6MTlxclBQNFpRQzNKWFc1WnNYRkgreUtEUG02VExsMDExYU0y?=
 =?utf-8?B?RnhUa0hBYVRmRThPM2tDRDE3YityK1JEUCtMVVRINGxqd2RoZitSUjhocWJl?=
 =?utf-8?B?UUZEelM4L1hJZDFLeFI3aDRQWGo1Z0s2Y2VjN1pQY0FMRUl1RGUrOGRSWE9t?=
 =?utf-8?B?NjJnOEFES3QybnJVcHZOSWZ2c1RtN3BpY3IyVjFJY2o1NUpuKzNLZU9GV3JN?=
 =?utf-8?B?amZiaXdYV1JYWFVYYUhURXhtckE4eFpxT1JlWWZlZDVlekZuTkd3KzFkcVpj?=
 =?utf-8?B?UFlLSUgwdFFKWDluc0JjZ3poUkREYVM4c3BhSFB5Z1RraVh6aUZXRVNrRndY?=
 =?utf-8?Q?tm9K6jKVNnEH2F1A/2Ipw5Ds9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B76ACF02D044854FA0E9BE5B3C4F8250@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ScF4I4gXu2C8/3Hnp3+g8lzC2RXG7PbDEpvotPvDk2J+o7NtEzP+P4PiZfU3fPqff5HuBWrzUF5DtRcNIWTVpDuJ2o2AREJkWx9J2CGD55ObYOdyoqxFA9ARwukAGO8MhtXG19/Sk/nwRt97vyOWw7VmcUXMfxMUMn9jjyTpe6CRmRxlvdQ8lmMcZbsum+Wed3cknUvlYystZ8acUXQmhxFVWmxVi4vB1JXVtTnAzPjWspn0Tmma1mf+Ct8rKZZJR6YU1kuVPT204bCmiXw4FSU52ibvEvAwjkRUmOE1VOGmS/2eAEvXL/KRq4rA/NdylcOND65mPinX0Xg7ck4tnp4GcgQ+sR4hVrGhamC5Zpb37l20nkcvxK8WwmWridCsRCNEg/TdETm9G5duo91j21wx/S0ykYRbXRUhuz+QCQdoywyNvaFUQgE1y7bpsqJEM3QK++XJRk5aqN5b7MhbfyXb6wSpT3ZRzFL4cJ65+jepdapIR+5zwNQIIvH8MXqaRpn3nKbN6uxxDwEoX9qT+gx4nFtxyobcOVrkiR70iS6d6NQPCsZ8zFS3aBA151j8inaAeYgug6fbUPZRDgg2aEQIIF9j7UBtG2i2iPzhvFCk30vuKVxU6wRF50Bu+cy7doibT2jKpfhDJdskFHdl3R2TRvIhTdP1Tbx99DyCrC77moeXI7VLL3rMRzLHBCsJW99HlThSCbxyEdynydBCzTZTeUWCK2Jn+jRRw2WL9yY0rd8hYtxRGjwfeYA4VbM9OBIJkygrQw2/2TRnI9LOx2xPEXHB//Y97VfzpfQD+Qn9OTRg8t4d4Rn+dKxr7Vn5Z1wLpWvGzypBvhNQCaBojA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03f9dae-140f-41bc-612d-08db769b93be
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 23:17:57.3305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YuJb7NG91Zf9lXjYge6zmiBnyOy/WS/OFbRwi5oEGecGc45u/B3zaENGwS9h5wKZvga5T3PeG+uXRUe2O+bO7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4503
X-Proofpoint-GUID: OqMB7mY5Bhmv6Q23JSnblpTyJxUUAW-O
X-Proofpoint-ORIG-GUID: OqMB7mY5Bhmv6Q23JSnblpTyJxUUAW-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_18,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=970
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306260216
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGksDQoNCk9uIFNhdCwgSnVuIDI0LCAyMDIzLCBMYWRpc2xhdiBNaWNobCB3cm90ZToNCj4gSGks
DQo+IA0KPiBPbiBGcmksIEp1biAyMywgMjAyMyBhdCAxMToyNDoyNFBNICswMDAwLCBUaGluaCBO
Z3V5ZW4gd3JvdGU6DQo+ID4gT24gRnJpLCBKdW4gMjMsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdy
b3RlOg0KPiA+ID4gSGksDQo+ID4gPiANCj4gPiA+IE9uIFRodSwgSnVuIDIyLCAyMDIzIGF0IDEx
OjAxOjU0UE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiA+ID4gSGksDQo+ID4gPiBb
c25pcF0NCj4gPiA+ID4gUGxlYXNlIHVzZSBnZXRfbWFpbnRhaW5lci5wbCB0byBnZXQgYWxsIHRo
ZSBwcm9wZXIgbWFpbnRhaW5lcnMgdG8gcmV2aWV3DQo+ID4gPiA+IHRoZSBjaGFuZ2VzLg0KPiA+
ID4gDQo+ID4gPiBUaGF0J3Mgd2hhdCBJIGRpZC4gVGhvbWFzLCBNSVBTIG1haW50YWluZXIgaXMg
cmVhZGluZyBsaW51eC1taXBzIGxpc3QsDQo+ID4gPiBHcmVnIGlzIHJlYWRpbmcgbGludXgtdXNi
IGxpc3QsIHlvdSB3ZXJlIHRoZSBvbmUgd2hvIHJlY2VpdmVzIGNoYW5nZXMsDQo+ID4gPiBoZW5j
ZSBhbGwgcGF0Y2hlc2V0IHdhcyBzZW50IHRvIHlvdSBpbiBhIGhvcGUgeW91IHByb3ZpZGUgc29t
ZSBjb21tZW50cw0KPiA+ID4gYWJvdXQgYWN0dWFsIGNvZGUgY2hhbmdlcy4NCj4gPiANCj4gPiBJ
IGNhbiB0YWtlIGEgbG9vayBhdCB0aGUgY2hhbmdlcy4gSG93ZXZlciwgdGhlIHBhdGNoZXMgd2Vy
ZSBzZW50DQo+ID4gZGlyZWN0bHkgVG86IG1lIGZvciBwYXRjaGVzIHJlbGF0ZWQgTUlQUyBhbmQg
bm8gb25lIGVsc2UgZXhjZXB0IHRoZQ0KPiA+IGxpbnV4LXVzYiBsaW51eC1taXBzICh3aXRob3V0
IFRob21hcyksIHdoaWNoIGRvZXNuJ3QgbG9vayByaWdodC4NCj4gPiANCj4gPiBJJ20gbm90IGZh
bWlsaWFyIHdpdGggdGhlIE1JUFMgc3Vic3lzdGVtLCBidXQgdHlwaWNhbGx5IGZvciB0aGUgVVNC
DQo+ID4gbWFpbGluZyBsaXN0LCB3ZSBjYXB0dXJlIGFsbCB0aGUgZW1haWxzIGdlbmVyYXRlZCBm
cm9tIGdldF9tYWludGFpbmVyLnBsDQo+ID4gYW5kIGluY2x1ZGUgdGhlbSBUbzogYW5kIENjOiBz
aG91bGQgdGhleSBuZWVkIGF0dGVudGlvbiB0byB0aGUgY2hhbmdlcy4NCj4gPiBPZnRlbiB3ZSBm
aWx0ZXIgb3VyIGVtYWlscyBiYXNlZCBvbiB3aGV0aGVyIGl0J3MgZGlyZWN0ZWQgdG93YXJkIHVz
LCBhdA0KPiA+IGxlYXN0IEkgZG8gdGhhdC4gQWxzbywgd2UgY2FuJ3QgYmUgc3VyZSBpZiBldmVy
eW9uZSBzdGlsbCBzdWJzY3JpYmVzIHRvDQo+ID4gdGhlIGNvcnJlc3BvbmRpbmcgbWFpbGluZyBs
aXN0Lg0KPiANCj4gRGlkIHlvdSBydW4gZ2V0X21haW50YWluZXIucGwgeW91cnNlbGY/IEJlY2F1
c2UgaGVyZSAoZm9yIHY2LjMpIEkgZ2V0Og0KPiAkIC4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5w
bCAtZiBhcmNoL21pcHMvY2F2aXVtLW9jdGVvbi9vY3Rlb24tdXNiLmMgDQo+IFRob21hcyBCb2dl
bmRvZXJmZXIgPHRzYm9nZW5kQGFscGhhLmZyYW5rZW4uZGU+IChtYWludGFpbmVyOk1JUFMsY29t
bWl0X3NpZ25lcjoxLzE9MTAwJSkNCj4gTGFkaXNsYXYgTWljaGwgPGxhZGlzQGxpbnV4LW1pcHMu
b3JnPiAoY29tbWl0X3NpZ25lcjoxLzE9MTAwJSxhdXRob3JlZDoxLzE9MTAwJSxhZGRlZF9saW5l
czoyMC8yMD0xMDAlLHJlbW92ZWRfbGluZXM6MjIvMjI9MTAwJSkNCj4gbGludXgtbWlwc0B2Z2Vy
Lmtlcm5lbC5vcmcgKG9wZW4gbGlzdDpNSVBTKQ0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnIChvcGVuIGxpc3QpDQo+ICQgLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIC1mIGRyaXZl
cnMvdXNiL2R3YzMNCj4gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPiAo
bWFpbnRhaW5lcjpERVNJR05XQVJFIFVTQjMgRFJEIElQIERSSVZFUikNCj4gR3JlZyBLcm9haC1I
YXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gKHN1cHBvcnRlcjpVU0IgU1VCU1lT
VEVNKQ0KPiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIChvcGVuIGxpc3Q6REVTSUdOV0FSRSBV
U0IzIERSRCBJUCBEUklWRVIpDQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgKG9wZW4g
bGlzdCkNCj4gDQo+IFNvIEkgaGF2ZSBubyBjbHVlIHdobyBlbHNlIHNob3VsZCBJIGFkZCB0byBD
YyBsaXN0Li4uDQoNCkZvciBlYWNoIHBhdGNoLCBwbGVhc2UgaW5jbHVkZSBhbGwgdGhlIGVtYWls
cyByZXR1cm5lZCBmcm9tDQpnZXRfbWFpbnRhaW5lci5wbCBpbmNsdWRpbmcgR3JlZydzIGFuZCBU
aG9tYXMncy4NCg0KPiANCj4gPiA+IA0KPiA+ID4gPiBTaW5jZSB0aGlzIGlzIGEgbGFyZ2UgY2hh
bmdlIGludm9sdmluZyBkaWZmZXJlbnQgc3Vic3lzdGVtcywgaWYNCj4gPiA+ID4gcG9zc2libGUs
IHBsZWFzZSBzcGxpdCB0aGUgY2hhbmdlcyByZWxhdGVkIHRvIE1JUFMgYW5kIHRyeSB0byB1cHN0
cmVhbQ0KPiA+ID4gPiB0aG9zZSBmaXJzdCBhcyB0aGV5IHdpbGwgYWZmZWN0IGhvdyBkd2MzIGds
dWUgZHJpdmVyIHdpbGwgbG9vay4NCj4gPiA+IA0KPiA+ID4gVGhhdCdzIHByZXR0eSBzdHJhaWdo
dGZvcndhcmQgYXMgcGF0Y2hzZXQgaXMgYXJyYW5nZWQgZXhhY3RseSB0aGlzIHdheSwNCj4gPiA+
IHNvIE1JUFMgbWFpbnRhaW5lciBpcyBmcmVlIHRvIGFwcGx5IHBhdGNoZXMgdGlsbCBkcml2ZXIg
bW92ZS4NCj4gPiA+IEhvd2V2ZXIsIGFueSBhY3R1YWwgZmVlZGJhY2sgd291bGQgYmUgc3RpbGwg
dXNlZnVsbC4gSW4gY2FzZSBpdCBnZXRzDQo+ID4gPiBzb21lIGFja3MgSSdsbCBhZGQgdGhlbSBh
bmQgcmViYXNlIHBhdGNoZXMgdG8gdGhlIGxhdGVzdCAtbmV4dC4NCj4gPiA+IA0KPiA+IA0KPiA+
IFRoZW4gdGhhdCdzIGdvb2QuIElmIHRoZSBNSVBTIG1haW50YWluZXIgYXBwcm92ZXMgYWxsIHRo
ZSBNSVBTIHJlbGF0ZWQNCj4gPiBjaGFuZ2VzIGFuZCBhbHJlYWR5IHBpY2sgdGhlbSB1cCwgdGhl
cmUgc2hvdWxkIGJlIG5vIHByb2JsZW0uDQo+IA0KPiBXZWxsLCByZW1haW5pbmcgcXVlc3Rpb24g
aXMgaG93IHRvIG1ha2UgaXQgY29tZm9ydGFibGUgZm9yIHlvdSB0byB0YWtlDQo+IGNoYW5nZXMu
IFBhdGNoZXMgMS03IGFyZSBpbiBtaXBzLW5leHQgYWxyZWFkeSwgc28gSSBwcm9wb3NlIHRvIHdh
aXQgdW50aWwNCj4gdGhleSBwcm9wYWdhdGUgdXBzdHJlYW0gdGhlbiBJIHJlYmFzZSByZW1haW5p
bmcgcGF0Y2hlcyB0byB3aGF0ZXZlciBpcw0KPiBpbiBsaW51eC1uZXh0Lg0KDQpZZXMuIFBsZWFz
ZSByZWJhc2UgdGhlIHJlbWFpbmluZyBwYXRjaGVzIGFuZCByZXNlbmQgdGhlbS4NCg0KPiANCj4g
UGxlYXNlIG5vdGUgSSBhZGRlZCBnbHVlIGRyaXZlciBpbnRvIE1ha2VmaWxlIGFuZCBLY29uZmln
IGF0IHJhbmRvbQ0KPiBsb2NhdGlvbnMgYXMgSSBmYWlsZWQgdG8gZmluZCBhbnkgbG9naWMgaGVy
ZS4gSWYgeW91IGhhdmUgYW55IHByZWZlcmVuY2UNCj4gb3Igd2FudCB0byBzb3J0IHRob3NlIGZp
bGVzIGFscGhhYmV0aWNhbGx5IGZpcnN0IGZvciBleGFtcGxlLCBqdXN0IGxldA0KPiBtZSBrbm93
IGFuZCBJJ2xsIGFkZCBzb21lIGNsZWFudXAgcGF0Y2hlcyBiZWZvcmUgc2VuZGluZyB2Mi4NCg0K
VW5mb3J0dW5hdGVseSB0aGVyZSBpc24ndCByZWFsbHkgYW4gb3JkZXIgdG8gdGhlbS4gV2hhdCB5
b3UgZGlkIGlzIGZpbmUuDQoNCj4gDQo+IEFsc28gY29sZWFndWVzIG9mIG1pbmUgbWVhbndoaWxl
IGZvdW5kIHRoYXQgUExMIGluZGVlZCBvY2Fzc2lvbmFsbHkNCj4gZmFpbHMgdG8gbG9jaywgc28g
d29ya2Fyb3VuZCBhdHRhY2hlZCB0byBjb3ZlciBsZXR0ZXIgaXMgcmVhbGx5IG5lZWRlZC4NCj4g
TmF0dXJhbGx5IGl0IGNhbm5vdCBzbmVhayBpbiBhcyBpdCBpcywgc28gdW5sZXNzIHlvdSBoYXZl
IGJldHRlciBpZGVhDQo+IEknbGwganVzdCBwb3J0IGl0IHRvIHJlY2VudCBkcml2ZXIgc3RhdGUg
YW5kIHdlIGNhbiBzdGFydCBkaXNjdXNzaW9uDQo+IGZyb20gdGhlcmUgaW4gYSBzZXBhcmF0ZSB0
aHJlYWQuDQoNCklmIHRoaXMgY2F1c2VzIGEgcmVncmVzc2lvbiwgdGhlbiBwbGVhc2UgZml4IGl0
IGJlZm9yZSBzZW5kaW5nIGl0IGluLiBJZg0KaXQncyBhIG5ldyBmb3VuZCBpc3N1ZSwgeW91IGNh
biBjcmVhdGUgYSBmaXggcGF0Y2ggYXQgYSBsYXRlciBwb2ludC4NCg0KVGhhbmtzLA0KVGhpbmgN
Cg==
