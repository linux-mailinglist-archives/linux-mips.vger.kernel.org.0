Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBEDB73ACD4
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jun 2023 01:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjFVXCF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jun 2023 19:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjFVXCE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Jun 2023 19:02:04 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3663F1BE3;
        Thu, 22 Jun 2023 16:02:03 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35MHWghH025000;
        Thu, 22 Jun 2023 16:01:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=4syRSPd98nqDyaG4pgimLNQslt4Clv+dC9fQak4JO58=;
 b=VywuFKQZh0X7Fey7MhdstbSi9WZm6G6iOKvVm+SkWlD/Ps3GJG951p9vIUJdHbjHlPtm
 DsErSuyzYM/dviGR9IMtcaC0gWpLnyENq6+Md3GuS8ruGlncFPwDzP+0Ft8E1DBppv/A
 Tp2ExeD29BrYdbrpWu2+5f011WW0x2e96P+YCzG/NXYZ2ORa5A6NZfxwrxjR1BRkSoGD
 UAnW1ykgBLzOfmnhErgmiEGNk+U+DRFGCX2dRMgDdiHm0oFu4+15jZ0NUkvPDNYuF0k9
 YNKt+n0OrSn29o2/ecPizvpWefb0VYGgouhMDdFul7MXkjyfy7ym445PoUtOVldlsKgK rw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3r9c35f7t0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Jun 2023 16:01:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1687474919; bh=4syRSPd98nqDyaG4pgimLNQslt4Clv+dC9fQak4JO58=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=kgSDJtrueCEYsB0jy4UnxmtQ7gkDiaXPgwl9UPqHTBWNl9Fk9JbZrfx/StchyOHTh
         5qhacIDsF5CAOHL/emN/KWxL4Nm/7KN2k1qj0AucRniYQ9bk6IhmbFPhrgclwBLyLu
         e/vaBoouvCunkx09AIVF+xph5578Eyylt9Y1ZCbqAJ9nYdqqPxfJDaPda6Q3V6Kckf
         KkpOaSi/PW3Rlbfj0+stGbe2ujhW0Pt/d1bLdKb/iRdANgVjgLpcYFA1PHz8GeIq0C
         Mq8WycY+XgjfIdraff661Ni1ErOI7jkX3khovKVsJsg7vLdkIUIiuKnFhvMlurepxW
         Lbspb+PLFFqZQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DEC7740121;
        Thu, 22 Jun 2023 23:01:58 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E18C1A0073;
        Thu, 22 Jun 2023 23:01:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=r2MoL/Js;
        dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 34E7740218;
        Thu, 22 Jun 2023 23:01:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONy51woZPu2ZddtJQfYvh48IcxyGDB9ZguCsjV2D+aHGKjRlR2shF+fR39Ma+NF9r+bLGJ6SiNr7WgFn7nRkb1R6bHoBIJbDOAfVZ2OXdu4Rf3GkAdkVaO7YJiY80DSXM/GT+KNSwtW2Mz9fDDM8/dFEG3mUfnyveCNmVf4edFYkNbYwPVHk+E6OcewY9szvvnulaI9OfhCFfijG4BgwLtOjrZzaD/YiHva+b80dCETxDrt3OtFba0IqsIowr4b0jD4XqlY2MoB7RF/5wVr2GOw8LDfRAQTN7hv/odYFAzMMyQ7D+IJCfnj7uKGfj4rub3IYf/5m4UP7fU8p1y5ueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4syRSPd98nqDyaG4pgimLNQslt4Clv+dC9fQak4JO58=;
 b=Uh2N5agSC+EkNhXwiInNLyjBhm6M63IG58fZN2Fvk01cWH5LAjgUwFi7ANYrWQVFCBL4F2F/Gcwokl7hK7J/nDFOR76+U1eYXrz/rYGnrpyl4MlBiDj26SFxmMqWTB7d4JJiXdqgwsB62EJAHPFPd1hG6Ru6lxpVCGQcvCt87e3CbKQTcJdfqEr1nsqUgBQRs68G54FZYWGXGDknc7hboJwtRi8+D1si2Nfd2Ibr8B1VsY4f0rMGWOxcjn9sRFix13QivOLA3P7wdXpJ5jw4rWaTHDq2EY3jFOcrvH8BAWImtwVaAaHWS2UXr7e3mD+Hfb2QszsYRVIrxUORLYdnqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4syRSPd98nqDyaG4pgimLNQslt4Clv+dC9fQak4JO58=;
 b=r2MoL/Js4R/kgVeDo1rj/kKrFX+0g5r+/30i33d9DlaqiKVVi705KZ95trNn3rhlPZnqns8TLyyM7F2W3uMV8xXgGSQvUx1PrDCR54Ca5Z3QescpGy09jdZduztvAJIwv/aAVAiA5p2densXHFPDuvd0ISQawqzViLaSxolMGSM=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CY5PR12MB6323.namprd12.prod.outlook.com (2603:10b6:930:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 23:01:54 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b%3]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 23:01:54 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 00/11] Cleanup Octeon DWC3 glue code
Thread-Topic: [PATCH 00/11] Cleanup Octeon DWC3 glue code
Thread-Index: AQHZoun2p3xHm/wYXk2RPs2fSTogha+XdTiA
Date:   Thu, 22 Jun 2023 23:01:54 +0000
Message-ID: <20230622230149.4wpvtlpsu7473txr@synopsys.com>
References: <ZJC165p0Mj4jHcBh@lenoch>
In-Reply-To: <ZJC165p0Mj4jHcBh@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CY5PR12MB6323:EE_
x-ms-office365-filtering-correlation-id: fd4ee093-5fa9-4e23-89c8-08db7374ac0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tMPdamtygJDEHFlLOfA9sZ3MpOTGUfUWW0R87ADItl4YBI4cA0nGpSEdGwpEBxR/acZ239AccdBxd4r437YYy8FzlqOIPrNFs5fzcqTwwC6smgHadb5dChU3Sso4WcyEBEHpXJtxXyy5KnzSmaJDVbUDSsCHK2dOYG5P6rg8OHd1iZTzo/unxcQcENbBSV+kWF0/B9L1RC8Q0ZvoiwzyhgPV5iAcEBk5jfVhHT4GtODsllDEFF3J1UZGbBCgok7WoiZzY0svlQ4jhnNcJz+w6x03iqwNAJO3B+HnXThcZv1MLEqK8QFuZeGyeIlsEIvJai/fJ2a81mFPZoB2TRqcjjaDIo5GCF9JLs1GC0ja4PLivxOrKm27Mg74MHu43zR8YJq89RgRl+j/1TsCvVuRBx2zAlAreT0wfL5trF+KC1BajLr+LIPShipQykNBXOzge/YeR8Ql14uyejN2rOimQXy4brUYkrbxnRkFA6/gUIeNL+55Q/WFlqs3sgxYfjgbHSKKa7tvTy2EaIgdyAOTGcA2RkmtY9SX1BCa+P8wxWq/smkNV2Loij/j/rKYpl5aoBDkuV28uWEKSNrdRTVfXbwgA32YOicl+ECEu2P04OCedWpRv3aEjlDypFMeztpN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(38070700005)(66899021)(86362001)(38100700002)(8676002)(8936002)(6916009)(66476007)(66556008)(64756008)(66446008)(66946007)(2616005)(316002)(41300700001)(83380400001)(5660300002)(6486002)(1076003)(6506007)(478600001)(71200400001)(6512007)(4326008)(186003)(76116006)(54906003)(26005)(122000001)(2906002)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3FQbE1xS1VvUkN4RStNUTg3WFZ1Z01YTjhqK3NnMWNmT3dmTDF5Snp3K2t3?=
 =?utf-8?B?TzdKaXpVQUd5Z3hLNlk2V0FaSTk5by9YWXZtOEZ1NEYwNnUzcTFMS3BqYWxx?=
 =?utf-8?B?THBzQkRBa1ZIVG1nUDFwcmc5RjBicnd3OXlNZ2FKclFPVUU2RGUvdjhNQTlm?=
 =?utf-8?B?Yk1NcUtQTkRNZ0NvdUJWMytzcEQ0Tm40bGk3eVUyckJkOWFnbk00eEZIVExJ?=
 =?utf-8?B?S29xeEdqQXJ0QXhqN3JWb2FBMWllMEZ2YXUwbmVrbE9zU3Q3NFVvWDA0QUcw?=
 =?utf-8?B?dXphVU8vaStmK3NLTnNucTh2OU5FV2tzZU1YbmpIdGtoRCtVSVllSG51dXhS?=
 =?utf-8?B?MXlIUkNCbWYwaVVwUVlQSktyVWxkTlRySURBdkZKVGZoUGRhRDVXR0ZSQVhV?=
 =?utf-8?B?R1pGbTFCeTF6eG9IbXhPQ0N3SUZkY1NXYVA1WFRYYlMzQXJvaVoyMTN5QWNH?=
 =?utf-8?B?NFZ1UkxqZExQNFJYQXNIblYzd2xjN0l1aVJUejFLOFRGS1ZRWExBUFFiUnI4?=
 =?utf-8?B?a3N2YUdWVDVleGNvdlA5N0FZWEVsTFA2K2t3cTJwd2lCbDY4MUc2WWN4TlFy?=
 =?utf-8?B?ajBrQU9YSEFuOHg4ZDNPMlJoMDJib05ZR042UEpZNjg5YWR0Mk9zdXRPN0Rn?=
 =?utf-8?B?bHJXU08vWmthTmltWlliZ0Zucy9PdVBESFVqMkdOL1IrbGducFZPbTU1aWJp?=
 =?utf-8?B?NVVPV0tIUWNDRGFtc2JDeHlwSW1NZTJ4Y0dQckNXSXZOdFJ6UzRiTndjZ3VE?=
 =?utf-8?B?M2U1WkZJL29PaG0vZ2h1WTQ5eTMvTVNpSkkzUjZwMytQZWpiNnRrTUoveW9y?=
 =?utf-8?B?OXEvd2Z4YUQzNHA2eERKWHpJd0FkTzNBeFB3dlZGdFMyRUxtQkZZRnMrS1ZB?=
 =?utf-8?B?cm9rRURlak5PSUxPaGZ0TFBYOWJOVmQvNVRGUW5ad3hONndhTk1tWWxJamhi?=
 =?utf-8?B?RHNxcUJVWTk4Ulg3RHBidm10MUlhTXVWVm1ldk0wVU9jaEk3eVJxQXo3TEs3?=
 =?utf-8?B?RGZEUkFLVlNDYllwdHJPU0k5Mmg4clNzcHNqSzhYTy9Nc2V0UkZ1L3JKck5t?=
 =?utf-8?B?OS9aSkhzTllENllLVmIyODh1UlNJYUtEb0pJSUlNaTcvNXp6cDBtcFVNVFA0?=
 =?utf-8?B?Wk9XSm1GMldJL3NZUFE1SHprRDlIM3FNRFFqS3lzTk56aDYwM3JSRnFVNFdx?=
 =?utf-8?B?RVR3NkRidGVBUG5aejFxSjlsSyt0cExXbUVwVWNxMUdRQjRScXNRYjQzQ09D?=
 =?utf-8?B?ZUdpV1VqMXVzVVJKRmJZY0xYMmRTSklqR2JpQXcxckdobHlvd3F0OUZHQTll?=
 =?utf-8?B?dnhRZDhPS1lKY3l5OFlCRkZoRVNEM282NWRnZ0dCaTEyZkFXbTlrdllSUk5X?=
 =?utf-8?B?NHdMRDhYRklyZTRGSXdjaHFBWG9WQkRtS244M1ZKTU16bUJyRTdxbFZGVzdH?=
 =?utf-8?B?ZGh3YkZYQllsNTVzWlhGRTZCcXZJOFI3WkhERUg5aml2ZzJOKzVBRjJ4RHV1?=
 =?utf-8?B?b2JmZE5iRXJMckxWTnovQ0dVSnhhSTVKRFczRHR4U0dvV2xTWWl6aE8xcXgw?=
 =?utf-8?B?Smd1RFZmdXZhcTFMQ2h3V3FWSWw3UDk2RURGNmtKYm1oMXhMR2Zkcmd1UUh1?=
 =?utf-8?B?Z3lnbHQrenhnSDFxS2QyZFBTUmFqODdjWks0QzBjWVlxenc3Rm1SUXhpSGwy?=
 =?utf-8?B?NnZoUkNaYTVwWnNWWXd1Y3ZRWG1CUFZqSHJKSkdWaE9GNnpJVjRCN2I3OWlN?=
 =?utf-8?B?T3ZJZDFGOWtrc2VDTWdJSkVIaWV4VlFHL0phMGJYVlEvajVvenF4cDZ2STBO?=
 =?utf-8?B?OVdKODBEL3dYbEU0STEvQWQrTll0NXNveGhEUXJlZjRpeDBvWnhWQ0Q2dm8y?=
 =?utf-8?B?VFF5Mm1SKzNCdlVkUk1TT054U1pxYitaRjZRaDhXSkNGWlczV3NEMnowZ0xy?=
 =?utf-8?B?S3I4bWJncE5NR2Z3VTNtYlZwdlp0S3RHd3RrZjZtTzJnOWNZVCtWSUNxb2NG?=
 =?utf-8?B?OTU3N1BsSUhsVncwNk55eG5mSFBzNUZNK0M5QVUzRG52OE81RnNQVkorVUoz?=
 =?utf-8?B?d1JTT0prRzdEcGk4ZmpiNitLbUhHNlRiOWxWcThZQis1SkFWZ3pReHVEWncy?=
 =?utf-8?Q?47dwHuJCtd8mJMua6Smoblnko?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86107191FE0C2F4C85BB7D5617AE2847@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 0P1cEcH2vEXcXlfKCr9VSxWIMfxbGZcMcJ2B3UN2arr1xBvxYjtsiksajj+q0a/7xKunUCyVUj4VHBDM+79HNsG7lbnajQfwYHU1H1Gt9pXt34atAZQBaAD8rOTFRR4ciAhQEAkNtQvej1XD0oC+uglAqCLNavb0OIqwGEG2xmGXGWWC1ILczmVT1y4xwnxeAwIoJNhIAKYskYqwCqgywJHBY8SuAZl1wiFv25mNASV+5dLjuONm4LbyRno6657Kqr6JEvDq7KtmEmNnF/fmDo7Nd7mejBBSonYI9XkYVqs8z5tYW8dWi6rIO87lETqkMvWgdzwb9Zgix6I3j6J2vd8tUC+RA6x/oTZM62oxoGqar4roM1ehABRrDe512qn3jYrSSpnrfRBJCby2jbHgIWNGevUkk0V8mYACHK3EOBbnPIC0EeCu4Uye91SDOBcedv/GhXPhQOHpMqhORqxWoLt8M8G0rf0CHg2FI5zJvUo80Jd2NybwMbMKfrp93q5jKMvcpxz61nOwR83nTnFVcRSAsgsnGS06Auew5mOSL66bbHvAmNldBZ16okFIBE+DLhhQ1C4jqbWQYsczAORMhPkX8UHepgTvphO6K8E25/upuIJoEEcyLS6yZGsffsy8DR4q7i5yem6TUwxg779KDr9QmQM3gRfKaHJVqPYCTr5vKcFsqlDw4FWTyMF/NhUv+K6wMwDvo1fpInAoHm0Fim8avSYPwu2uz2D9godyX4HhBOxhnf2OXRiMegS5F0AfsUHtFg9UbDDOFqFQ4WdAUZBc7XHSzMtDk7cJUjxaO1EA5odt5GZCbl///BpSQC9yFhkigGGXdDoHruOzKgxNUg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4ee093-5fa9-4e23-89c8-08db7374ac0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 23:01:54.2937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AzYWDbYIVnVFSiDSk4j3TG3agsGLeK24KpbBCM1hPA51FycNDSbVv4Wc+7HoP0vyVfuEoZiif1g1fBuR0pRrPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6323
X-Proofpoint-ORIG-GUID: UGCUIyXBEWNLzfFXdcw_PMkVu_0APm3p
X-Proofpoint-GUID: UGCUIyXBEWNLzfFXdcw_PMkVu_0APm3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_16,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 mlxlogscore=662
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306220197
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGksDQoNCk9uIE1vbiwgSnVuIDE5LCAyMDIzLCBMYWRpc2xhdiBNaWNobCB3cm90ZToNCj4gSGks
DQo+IA0KPiBwcmltYXJ5IG1vdGl2YXRpb24gd2FzIHRvIGZpeCBpc3N1ZSBJZCAyOTIwNiBhcyBk
ZXNjcmliZWQgaW4NCj4gT0NURU9OIElJSSBDTjcwWFgvQ043MVhYIEtub3duIElzc3VlcywgdmVy
c2lvbjogMS45Lg0KPiBTYWlkIGRvY3VtZW50IGlzIG1hcmtlZCBhcyBNYXJ2ZWxsIFByb3ByaWV0
YXJ5IGFuZCBDb25maWRlbnRpYWwsDQo+IHRoZXJlZm9yZSBJJ20gbm90IHN1cmUgaWYgSSBjYW4g
Y2l0ZSBmcm9tIGl0Lg0KPiANCj4gVGhpcyBwcm9iYWJseSBkb2VzIG5vdCBtYXR0ZXIgdG9vIG11
Y2ggYXMgdGhlIHJvb3Qgb2YgdGhlIGluZm9ybWF0aW9uDQo+IGxpc3RlZCB0aGVyZSBpcyBhIHdv
cmthcm91bmQgYmVpbmcgaW1wbGVtZW50ZWQgaW4gT0NURU9OIFNESyAzLjEuMg0KPiBwYXRjaCA3
IGFuZCBsYXRlciBpbg0KPiB1LWJvb3QvZHJpdmVycy91c2IvaG9zdC94aGNpLW9jdGVvbi5jOmR3
YzNfdXBoeV9wbGxfcmVzZXQoKQ0KPiANCj4gTXkgY29sZWFndWUgcG9ydGVkIHRoYXQgcGF0Y2gg
dG8gbGludXgtNC45IGFuZCBpdCBpcyBhcHBlbmRlZCB0bw0KPiB0aGlzIGNvdmVyIGxldHRlciBm
b3IgYSByZWZlcmVuY2UuDQo+IA0KPiBUaGUgZ2x1ZSBjb2RlIGN1cnJlbnRseSBsaXZlcyBpbiBh
cmNoL21pcHMvY2F2aXVtLW9jdGVvbi9vY3Rlb24tdXNiLmMNCj4gYW5kIGxvb3BzIGZvciBlYWNo
ICJjYXZpdW0sb2N0ZW9uLTcxMzAtdXNiLXVjdGwiIGNvbXBhdGlibGUuDQo+IEhvd2V2ZXIgdGhl
cmUgaXMgbm8gYm9uZCB3aXRoIGR3YzMgY29yZSBjb2RlLCBzbyBpZiBhbnl0aGluZyBnb2VzDQo+
IHdyb25nIGluIGdsdWUgY29kZSwgdGhlIGxvb3AgYnJlYWtzLCBsZWF2aW5nIGR3YzMgaW4gcmVz
ZXQuDQo+IA0KPiBMYXRlciBvbiB3aGVuIGR3YzMgY29yZSB0cmllcyB0byByZWFkIGFueSBkZXZp
Y2UgcmVnaXN0ZXIsIGJ1cyBlcnJvcg0KPiBpcyBlbWl0ZWQsIGxlYWRpbmcgdG8ga2VybmVsIHBh
bmljLg0KPiANCj4gVGhlcmVmb3JlIGdsdWUgY29kZSBpcyBjbGVhbmVkLXVwIGZpcnN0LCB0aGVu
IG1vdmVkIHRvIGRyaXZlcnMvdXNiL2R3YzMNCj4gYW5kIG1vZGlmaWVkIHRvIG1hdGNoIGN1cnJl
bnQgc3RhdGUgb2YgYXJ0Lg0KPiANCj4gTm93IGl0IGlzIGVhc2llciB0byBwcm9wZXJseSBpbXBs
ZW1lbnQgc2FpZCBlcnJhdGEuIERvZXMgaXQgYmVsb25nDQo+IHRvIGNvcmUgY29kZSBhcyBhIHF1
aXJrPyBDb21tZW50cyBhbmQgc3VnZ2VzdGlvbnMgd2VsY29tZS4NCj4gDQo+IExhZGlzbGF2IE1p
Y2hsICgxMSk6DQo+ICAgTUlQUzogT0NURU9OOiBvY3Rlb24tdXNiOiBhZGQgYWxsIHJlZ2lzdGVy
IG9mZnNldHMNCj4gICBNSVBTOiBPQ1RFT046IG9jdGVvbi11c2I6IHVzZSBiaXRmaWVsZHMgZm9y
IGNvbnRyb2wgcmVnaXN0ZXINCj4gICBNSVBTOiBPQ1RFT046IG9jdGVvbi11c2I6IHVzZSBiaXRm
aWVsZHMgZm9yIGhvc3QgY29uZmlnIHJlZ2lzdGVyDQo+ICAgTUlQUzogT0NURU9OOiBvY3Rlb24t
dXNiOiB1c2UgYml0ZmllbGRzIGZvciBzaGltIHJlZ2lzdGVyDQo+ICAgTUlQUzogT0NURU9OOiBv
Y3Rlb24tdXNiOiBtb3ZlIGdwaW8gY29uZmlnIHRvIHNlcGFyYXRlIGZ1bmN0aW9uDQo+ICAgTUlQ
UzogT0NURU9OOiBvY3Rlb24tdXNiOiBpbnRyb2R1Y2UgZHdjM19vY3Rlb25fe3JlYWQsd3JpdGV9
cQ0KPiAgIE1JUFM6IE9DVEVPTjogb2N0ZW9uLXVzYjogY2xlYW51cCBkaXZpZGVyIGNhbGN1bGF0
aW9uDQo+ICAgdXNiOiBkd2MzOiBNb3ZlIE9jdGVvbiBnbHVlIGNvZGUgZnJvbSBhcmNoL21pcHMN
Cj4gICB1c2I6IGR3YzM6IGR3YzMtb2N0ZW9uOiBDb252ZXJ0IHRvIGdsdWUgZHJpdmVyDQo+ICAg
dXNiOiBkd2MzOiBkd2MzLW9jdGVvbjogTW92ZSBub2RlIHBhcnNpbmcgaW50byBkcml2ZXIgcHJv
YmUNCj4gICB1c2I6IGR3YzM6IEFkZCBTUERYIGhlYWRlciBhbmQgY29weXJpZ2h0DQo+IA0KPiAg
YXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vTWFrZWZpbGUgICAgICAgICAgfCAgIDEgLQ0KPiAgYXJj
aC9taXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXBsYXRmb3JtLmMgfCAgIDEgLQ0KPiAgYXJjaC9t
aXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXVzYi5jICAgICAgfCA1NDggLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAg
IDkgKw0KPiAgZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDEg
Kw0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jICAgICAgICAgICAgfCA1NDUgKysr
KysrKysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2Ytc2ltcGxlLmMg
ICAgICAgICB8ICAgMSAtDQo+ICA3IGZpbGVzIGNoYW5nZWQsIDU1NSBpbnNlcnRpb25zKCspLCA1
NTEgZGVsZXRpb25zKC0pDQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9taXBzL2Nhdml1bS1v
Y3Rlb24vb2N0ZW9uLXVzYi5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy91c2IvZHdj
My9kd2MzLW9jdGVvbi5jDQo+IA0KPiAtLS0NCg0KUGxlYXNlIHVzZSBnZXRfbWFpbnRhaW5lci5w
bCB0byBnZXQgYWxsIHRoZSBwcm9wZXIgbWFpbnRhaW5lcnMgdG8gcmV2aWV3DQp0aGUgY2hhbmdl
cy4NCg0KU2luY2UgdGhpcyBpcyBhIGxhcmdlIGNoYW5nZSBpbnZvbHZpbmcgZGlmZmVyZW50IHN1
YnN5c3RlbXMsIGlmDQpwb3NzaWJsZSwgcGxlYXNlIHNwbGl0IHRoZSBjaGFuZ2VzIHJlbGF0ZWQg
dG8gTUlQUyBhbmQgdHJ5IHRvIHVwc3RyZWFtDQp0aG9zZSBmaXJzdCBhcyB0aGV5IHdpbGwgYWZm
ZWN0IGhvdyBkd2MzIGdsdWUgZHJpdmVyIHdpbGwgbG9vay4NCg0KVGhhbmtzLA0KVGhpbmg=
