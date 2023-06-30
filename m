Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D310E74440C
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jun 2023 23:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbjF3Vp6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jun 2023 17:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbjF3Vp4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jun 2023 17:45:56 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565EB35B7;
        Fri, 30 Jun 2023 14:45:55 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35UIPsfv009842;
        Fri, 30 Jun 2023 14:45:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=TrSkSdPqxdRxTJTfeWzZ9x+BDARb1HsgFrd7C2A4ktM=;
 b=d55g5svnp9YPXRUoiyMkOVOycT2ZJQRxJb+/aSeBIJ9Ih+HhjG4HIAtUcL8iOiS5jNzP
 D34oQvYGJWTxxL59o3C76krPcP6P87uZ/xznGWBfp4e8fPbaac1RURHREi8qe82/HFV2
 iVfA8eno9QXuNupaG6Mq+KG3o5B9wfWHzJxdDgDGKEhfbssNAMVw2Je+E7IWkieGv0So
 e+1LmU7FhYgqh+04sjTpHRRtOqYPAI9vrG+DWh/XPJqpwlKwEI7K4oLhDEeQhE2QwTqX
 B3o7JR+8zSHpb586nM0cduClC15ZAwlRA4zLSX1ExDMKsIAFUW+i8RNXxV1n6nWqqcEZ /w== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3rdydujr3d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 14:45:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1688161550; bh=TrSkSdPqxdRxTJTfeWzZ9x+BDARb1HsgFrd7C2A4ktM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Qn75Rh90tudvOnuke/pHA2T0/DJmc216tdHPz5Snc/k/1QSbxb3YlIQR4le48Q4IP
         be71eRBhXCD8MZFwlGjs0YU1MIjSHOu1GdZuB7vyl9OMHIjL542dwoN8GhfO36KZD0
         7IVvRfsvqcYZ0+PH4RQbIfd0wkqdIO7RoFW7zNTxkrnKK5EnyOeMZkocuK6wRR8wPv
         OALApOCjClHfKFW2gtLPRuE/CiK65A2jXAK7+9a8j5ELrZRBFKCmBVSe0PyhWSVC9e
         XCYa9BB8aUj1Nh91Hl+EWHVnT3Mgj08MsBLjkPuLdUgkrKs69Go5Jbv00jrOC9QmjD
         qpwRN/JY2Yw2g==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A4361401D0;
        Fri, 30 Jun 2023 21:45:49 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 617C1A006F;
        Fri, 30 Jun 2023 21:45:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=IxbZC3Nh;
        dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id E70EF4013F;
        Fri, 30 Jun 2023 21:45:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqJem+eGvNlvUN6qNlBFvx78zIcustgEonKek3M1LZacN4/KWSwdocn2+Wucao7BHvYWtQcxu8R9MRquNeKrLf059GqRaLCFViMcEsowVSg0vG0He+PWxXd4nBw8jWzhxWkgrc2dspT2pT4qvj3/Fp1p0TA+emoAv0Tb8w+0AZhCBVgYStrCvYnwMovIey1bB0/p8+5a11zx3f/LveptHLS+bl/vbmeU86YfgbZdo9/e2MBFI+FVBQ0MBrmGnqNNQG4KoPIg5fTW7jtf01IZjzPv8VCENquqbyCuyaVjbhbEct3kcpkfNKgQT0dNRAuSDURfzTKA8CdR43co7DW7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrSkSdPqxdRxTJTfeWzZ9x+BDARb1HsgFrd7C2A4ktM=;
 b=DRq45MTCb0CMUpJE7gjv5punoVQv0J0ysk0wd2+hWSPLfd2zOH+52NoBNMJsvU9Sq7HpyWvbmXlEg7mHo0xB6NusPQ5KbZOB69RLnTRbE7TvnrdcrLpPLCCbYn+zN7gXG7ldwPVLI0PUnB1kZsongNaaMu6qRelVKEUY6G5oOi+p6GWd8nZEqfpfNAEzkdh9DXZ4fLetqXC1KOZCaoOn29RXcZsNSeend0aNpv16naXLAGeS7gMEBKhi0xQM3Hc0mIPxc7eqHciiznZn5Gase+TSr25K7dqvQtqRm60OGltKxK2fieQDSbKQGWmwV2JcKeeQlaJ23ers+HHSktwS6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrSkSdPqxdRxTJTfeWzZ9x+BDARb1HsgFrd7C2A4ktM=;
 b=IxbZC3NhoKAmVnQZzuHppvPTsektPU4nWIYR1+wNByp2F8EjGCWGQcPixuDjULIxrw+CQOGqGRs2rDE5dWTAeg7x7uCdFXLPKIjLemib1E06jVl9XBjqdFe4uW9g4342LRd0803VrO00BMXV2O40aLfAz7NHa3ASChsE1IV8tKA=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB5512.namprd12.prod.outlook.com (2603:10b6:a03:1df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 21:45:43 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b%3]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 21:45:43 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 00/11] Cleanup Octeon DWC3 glue code
Thread-Topic: [PATCH 00/11] Cleanup Octeon DWC3 glue code
Thread-Index: AQHZoun2p3xHm/wYXk2RPs2fSTogha+XdTiAgACVkICAAQMQAIAA5RYAgAPQG4CABXXGgIAAuckA
Date:   Fri, 30 Jun 2023 21:45:42 +0000
Message-ID: <20230630214540.bkimnyfpyduqtfak@synopsys.com>
References: <ZJC165p0Mj4jHcBh@lenoch>
 <20230622230149.4wpvtlpsu7473txr@synopsys.com> <ZJVQUzVW+NzCgH7i@lenoch>
 <20230623232420.vfvkqkcee5jrrkmo@synopsys.com> <ZJbp0P5fYkvTLN5g@lenoch>
 <20230626231753.jumwoztg464q5656@synopsys.com> <ZJ6xK7SJ7PwLril7@lenoch>
In-Reply-To: <ZJ6xK7SJ7PwLril7@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BY5PR12MB5512:EE_
x-ms-office365-filtering-correlation-id: 6c710e83-f606-4339-ec13-08db79b35a85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H+Iqvt7L7o4sz2x7fpaTq4aOe3i6QoGAIGyhWnmBH7+qGHVyqjr5rvi9PJ/AqbnygoFPC30m7WgoJEdIhAUvTMVzmYdD1ZbVM9zLUAatekfNWBjAQi8XIDTjE8RVLzAtkhF3BvVrwUlDsvm0URumaDjPZkpbybMUkvCoJzDsJtSNqQpbPyPoLhyTryRXggU5IuX+4Ok3U17Ianu22Y6bbb5x9yuTXhaiSe3Z8x9zkoId4Ssa7l0Y3lKJEoZSuADIUZPMuzXI1TM+a+wj52JJsJX1jEk3rEpVMff5BVRlCgCadY3I9uPM+rfMS5xV0cICYFMvY5YN7xPcl3Ln8zrjRQNo7ucRWJgUSnha3y1EzrBoTqsUw7zVIRG6FOMdhbzt1eL3FMhdAtDOAO1CIu273FPnOTS0zl9WLjXaiHBdg+HImWPfyFJchgAVSmgNJgy4QtgkE55I2V8HtlcGdC+gpQ1JEMXwunlNpFfLK3vGYwQUvqHtX/HxJOa2PLEws2JLGnvqJi3X7FdtoZNrwP3sXNSlxmP6qRK3EGcpXZKra2JSejvr6nBk4ACBGw850NAu+sTgys6j3u3eytAMKSHSZTEogf7Ww9LhI5c73vsaDPmgHoM7mjpkT/5Mfvgmv4WN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199021)(86362001)(54906003)(71200400001)(8936002)(8676002)(5660300002)(26005)(6506007)(1076003)(6486002)(478600001)(66946007)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(6512007)(41300700001)(76116006)(316002)(186003)(38070700005)(2616005)(2906002)(3716004)(83380400001)(36756003)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVJoRlRNVmxRZFk4a3VOZit6UC96Mzl0R2JST0JyWGNxYXB2YWtEa1ErcXlQ?=
 =?utf-8?B?SFJTZnBYNzBiU1NvY2RSVm0zQy9MR3RYamN5YnZZMDRiekxuR2tIVmtKTThV?=
 =?utf-8?B?N2pZWUQrTXFnT0lTcm1tc2lyU2FjQXhTSHFCaENSKzJCTmZxT0VON1ZTbTNC?=
 =?utf-8?B?enFTcGNZQ2hHRnRQTnhNUjl4US9pRTVqZnNISkZYMGw5QmVaam9SOFZhWFd4?=
 =?utf-8?B?Y2VJWGpaZWhiUlYxZzJnWThsZ05FVlQ5TlJZRmltWHNPTWNSRkswbDRyWkE1?=
 =?utf-8?B?VTh3L2EvQW9TNUlTMlJnVlgxVyt5NWhtUzBTZ0g5Y1h4cjhYZU81ek5IMTZ5?=
 =?utf-8?B?T09kWTdReWJxK2UvTkVEYVVJYUJ2cm5jR0lvQkhzZUZXcXB1bmwzU05mWE1L?=
 =?utf-8?B?MmVSeUJ0aWNMQUV3U2RXUEt3M0RhVTJVNnZVN0VuVzBaSW51OVRWYVBHZzJT?=
 =?utf-8?B?L0ZTS0NIU0YyL1NyTmt5a3NNQ3JWSzhTQ1RQNnlWYWdHaE1neWY3NUxtSUxt?=
 =?utf-8?B?RVBTNlp2L3NPRzY2Y0lCc1laYWhLV2FLb2ZXcExxdURza21Kem5ueU5hT0E2?=
 =?utf-8?B?cGlOZVV0ZkJkN25ZNFJsVDFBN3NFRHZxYjlXRnd4L1FENWxpZEloZVlKQ1o4?=
 =?utf-8?B?c3pERnVVL3pkeGplWWk1ZEQ2Zkxod2Rxb0FiTllSZkh4NW1JM0lnMSsvczJw?=
 =?utf-8?B?OUgwWmY2QXJSakJXbk4yNjZCdllRdXlQN1VoQnpEbUJ3QTBqSzJQM2hOV2xZ?=
 =?utf-8?B?dVgvNmdNRkdQSEh4Qi9ZSDFkdkV4dW00cWo5anVkOUJkcncxR1dGT3BSVG5i?=
 =?utf-8?B?T0d1ZGt4bGtEMVZ5VmhzZDQyRk5FQUlMd1Z1ak0rL2p1eUtuMldWcWZvSDUx?=
 =?utf-8?B?RGRpNUtoM3VOd0Z1MTJxc2hqL0pHMGdDc3J3RllJYyt2V1k1RFU2MXdJVnhw?=
 =?utf-8?B?cHVQaEVNbEhvUXdRcmlGcndZV1I0ems0eXdCd2JNZ3ROQXJMQ0hSSVBGOGNR?=
 =?utf-8?B?SXI4eHBEOTZiUkxmeHhiVzNvSis3bGZVWUZsR1pTZFFkSlNkMHlReEQ1cjV6?=
 =?utf-8?B?KzhUclA1d1NNYm1uejNKSUt0aTAvbnpyTkZSSEJ6ckk3WWFhelVDMlpaQ0Fh?=
 =?utf-8?B?WkQ5bDNoeGZjWGYzb2lJbjFSSGxOZEgyWU4yN0RsdkdvdUl0aWRiazN3NDRi?=
 =?utf-8?B?WmFEL005K2FveVNyN1lFK2tPQ0tQQkJoUkNoaWRhRW1XQy8zcUlwTklUN2xz?=
 =?utf-8?B?dXlVNVVNclZ5RmUreVBxYWIzQmEySUlHN2Fpek1lYlEwN3BTZENFMlJqR0xr?=
 =?utf-8?B?ZkxiUHhBVzg5TGthaENRT2IxNXcrT2Z6RExCYUZSVVc3V1VvYlA2TmlBVHpu?=
 =?utf-8?B?djBFQldJdjJ0UDVKT3kwMGNaaWJ5RU9JdDMrbmcxRytXdExWajRTeXFwSkh3?=
 =?utf-8?B?amJRU09XMmMvWmNreGIvS2JUNDRQcFNvNUV0RFgxVjgvc05wNVdzNkYxVjh5?=
 =?utf-8?B?aE9WZi9id3doMDFVN0QrNkRvSytQYi80eXc2dm5IRFg0c2g5MWtiTWF5STlv?=
 =?utf-8?B?LzlaWWlSajhYd1RWUDlmMldxcVp1Z3RvRnZrOTBYa2hna2x0MS94YUE4dFhY?=
 =?utf-8?B?NkNNcXBTc0RoTWpldkJIc1cwaVR6V0lodmtHQ0ZmN3FleWtxeFdoQSswVGE0?=
 =?utf-8?B?NWNMZVMxRHo2bkZ6eDhOamxhYXQ3anViMWpFWUZqYkN5UktpSkdYVURLR05B?=
 =?utf-8?B?TFlpVHZUY0RFWjNycGd5T3Y4aEJ4OElTK2s3VG5pSWN0NHZROHRhVk9KL3gv?=
 =?utf-8?B?OGx6RnJBVDFVWFYzRURUbU8wQ0hZNllqelYwT2xIWjVXaENPc2t6QzZGazI3?=
 =?utf-8?B?S29kOTM1VVJIY29HR2piUnlNVzd3Tmc5NUdaZXBSeXhCUUk3cmVxQnZvUjRh?=
 =?utf-8?B?WGYxT2NGYUt6SEQxWHVMS2FxYzU4NkNITHptaEU0ZEp4QkdRdkl3QkNtN0hJ?=
 =?utf-8?B?aTVrY1E0RlkzNTRaTXBURFZJeE0ySk1QbHo0RENHcHdJdFpJQjg5SDNVdVZS?=
 =?utf-8?B?MTdIbGFVZGRtZXQ2aElSQjQ1cVVsUktWdFk2REZyRTVZTDZiSmZ4U1dWc212?=
 =?utf-8?Q?uCBsRjocctu1UT3m4a3tosvpb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4C182914639CB42AFA05C76868EA9DD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: axGQR74KbZWG7dKZoW2kLq/oj33jUeHP0iYo90tZcHkzzLYAkG2Pvif/FYifvlVezLsDiQKA7+lfOubJpkTZWGlSERL6VZ+8qWVXHPYfOmSDuDdVUA2XW+M7A4lWk2VwStTnd6iCKKg5Mh1G/pjGa4Yd4F6nr0OjWoX5VE6dDL4YyISrClu19qMYt2W/yDHMupgc0pj0geOueg+tK7RKt/HisYPziUUL9IXo8M3pAlFYTl7EphtEVS8+s0YUDaPts3xfmoknfo8ySxG0xDMglPSeywPcH0jEuCGNEEYGNool4LgNW/OcMUKgPz3VH2rYXN7dZOVMS+0oux669NPLGiAiXEBBrvXOgFFGMlqmEtUbxG5w5sslbV/L4GTkre8NsE5hcXYCXQ6vQt4aRkdhlI5W5iNCZ/Llx+GrASHXQ8lVtMg6rxEcHj2AQCvgXP1v4cMx7Ruf+4GmWNDVvGGSYszSJHEoQi4sW89oOWvFEb9JB+onA8z4+oPs3n0jlgYwrQtCQo+HNy85tI4mBo/vNMXTeylkxvGigP14YQC0eRq0NWQv4UtUjL+hbJ7PWVivmDD6i6+ROE7+a9dirYdzMRfJj7r0ouZZKT8oN1ZAJyDuyHEugEhO2a0DVytMspLT1+RpEnAgBu5YPdX/0UrcfObbgxAYlsgC8KR/kAiZuVgLycPKWy6Nw+t5VpgOAyHle30XjUKgoUbtb87vd6e191M6p/uGzXXWRsEvrrV49Eiv0t7PpuouB2PLkAUnUIW3yhGeCfG4DGKuFxxUlSrywwB68eCN0gw9veGhuSVsgVNI6r0POxrwluVQj/TvzbOKpPRlhNDM8/yFbCOoBlXcYg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c710e83-f606-4339-ec13-08db79b35a85
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 21:45:42.7510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OerEPvu4ALyh2fC+wcIxM8eWohUWC0JggndUXwP4SeQUl4qOQ43FfqPIK7cUsEUQnjzOihCM8QillIqhxf3xKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5512
X-Proofpoint-GUID: Z42LLbuaF4MZUInoSPuWwiRQK1zOxV4f
X-Proofpoint-ORIG-GUID: Z42LLbuaF4MZUInoSPuWwiRQK1zOxV4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_12,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306300190
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGksDQoNCk9uIEZyaSwgSnVuIDMwLCAyMDIzLCBMYWRpc2xhdiBNaWNobCB3cm90ZToNCj4gSGks
DQo+IA0KPiBPbiBNb24sIEp1biAyNiwgMjAyMyBhdCAxMToxNzo1N1BNICswMDAwLCBUaGluaCBO
Z3V5ZW4gd3JvdGU6DQo+ID4gSGksDQo+IFtzbmlwXQ0KPiA+IEZvciBlYWNoIHBhdGNoLCBwbGVh
c2UgaW5jbHVkZSBhbGwgdGhlIGVtYWlscyByZXR1cm5lZCBmcm9tDQo+ID4gZ2V0X21haW50YWlu
ZXIucGwgaW5jbHVkaW5nIEdyZWcncyBhbmQgVGhvbWFzJ3MuDQo+IA0KPiBJIGFscmVhZHkgZXhw
bGFpbmVkIHdoeSBpcyBDYyBsaXN0IGNvbnN0cnVjdGVkIHRoZSB3YXkgaXQgaXMuIERlc3BpdGUN
Cj4gZm9ybWFsIHJ1bGVzLCB0aW1lIGlzIGEgc2NhcmNlIHJlc291cmNlLCBzbyBsZXQncyBub3Qg
ZHJhdyBwZW9wbGUncw0KDQpOb3cgdGhhdCBkb2Vzbid0IHNvdW5kIGZhaXIgdGhhdCB5b3UgdGhp
bmsgbXkgcmVzb3VyY2UgaXMgbW9yZQ0KZXhwZW5kYWJsZS4gOikNCg0KPiBhdHRlbnRpb24gdG9v
IGVhcmx5LiBBbnl3YXksIGlmIHlvdSB0aGluayB0aGVyZSdzIHNvbWV0aGluZyB0aGF0DQo+IG5l
ZWRzIHNvbWVvbmUncyBzcGVjaWFsIGF0dGVudGlvbiwgeW91IGNhbiBzdGlsbCBleHRlbmQgQ2Mg
bGlzdA0KPiB5b3Vyc2VsZi4NCg0KSSdtIGp1c3QgYXNraW5nIHlvdSB0byBmb2xsb3cgdGhlIHN1
Ym1pdHRpbmcgcGF0Y2ggcHJvY2VzcyBhbmQgYWRkIHRoZQ0KYXBwcm9wcmlhdGUgbWFpbnRhaW5l
cnMgb24gYW55IGNvZGUgdGhhdCB0aGV5IG1haW50YWluLiBZb3UganVzdCBpZ25vcmVkDQp0aGUg
Z2V0X21haW50YWluZXIucGwgb3V0cHV0IGFuZCBvbmx5IGFkZGVkIHdoYXQgeW91IGZlZWwgbmVl
ZGVkLg0KDQo+IA0KPiBCZWZvcmUgc2VuZGluZyB2MiwgbWFpbnRhaW5lcidzIHJldmlldyBvciBh
Y2sgaXMgbmVlZGVkLiBJIGFscmVhZHkNCj4gY29sbGVjdGVkIFRob21hcycgYWNrIGZvciBhIG1v
dmUsIGJ1dCBoYXZlIG5vdCByZWFkIGEgc2luZ2xlIHdvcmxkDQo+IGZyb20geW91LiBEbyB5b3Ug
cGxhbiB0byBkbyBzb21lIGFjdHVhbCByZXZpZXcsIHNvIHdlIGNhbiB0YWtlIG5leHQNCj4gc3Rl
cCBvciBhcmUgeW91IHdpbGxpbmcgdG8gd2FpdCBmb3IgYSB2MiB3aGljaCB3aWxsIGFkZCBvbmx5
DQoNClBsZWFzZSBiZSBwYXRpZW50LCBJJ2xsIGdldCB0byB5b3VyIGNoYW5nZXMgd2hlbiBJIGNh
biwgYW5kIEknbSBub3QgdGhlDQpvbmx5IHJldmlld2VyIGhlcmUuIFlvdXIgc2VyaWVzIGlzbid0
IGV4YWN0bHkgc21hbGwgb3IgZWFzeSB0bw0KdW5kZXJzdGFuZCBmb3IgbWUgdG8gcmV2aWV3IHF1
aWNrbHkuDQoNCj4gb2N0ZW9uX2dldF9pb19jbG9ja19yYXRlIHN0dWIgZm9yIG5vbiBPY3Rlb24g
YnVpbGRzIChoYXZpbmcgY2xrIGFwaQ0KPiB3b3VsZCBiZSBuaWNlIGhlcmUsIGJ1dCB0aGF0J3Mg
ZGlmZmVyZW50IHN0b3J5KT8NCj4gDQo+IEFsc28sIHBlcmhhcHMgaXQgd291bGQgYmUgcmVhc29u
YWJsZSB0byBzcXVhc2ggcGF0Y2hlcyA4IGFuZCA5Lg0KPiBXaGljaCB0cmVlIHRvIHlvdSB3YW50
IGl0IHRvIGJlIHJlYmFzZWQgYWdhaW5zdD8gQ3VycmVudGx5IEknbSBhdA0KPiBsaW51eC5naXQg
bWFzdGVyIGFuZCBjaGFuZ2VzIHdlcmUgcmV0ZXN0ZWQgaGVyZS4NCj4gDQo+IEknZCBwcmVmZXIg
dG8gc2VuZCBmZXdlciB2ZXJzaW9uIGlmIHBvc3NpYmxlLCBzbyBhY3R1YWwgY29tbWVudHMNCj4g
b24gY29kZSB3b3VsZCBjZXJ0YWlubHkgaGVscC4NCg0KV2VsbCwgeW91IGNhbiBoZWxwIG1lIGFu
ZCBvdGhlciByZXZpZXdlcnMgYnkgc3VibWl0dGluZyB2MiB3aXRoIHlvdXINCnJlYmFzZWQgY2hh
bmdlcy4gSSB0aGluayBpdCdzIGFwcHJvcHJpYXRlIGhlcmUgZ2l2ZW4gdGhhdCB0aGlzIHNlcmll
cw0KdG91Y2hlcyBvbiAyIHNlcGFyYXRlIHN1YnN5c3RlbXMuDQoNCj4gDQo+IFtzbmlwXQ0KPiA+
ID4gQWxzbyBjb2xlYWd1ZXMgb2YgbWluZSBtZWFud2hpbGUgZm91bmQgdGhhdCBQTEwgaW5kZWVk
IG9jYXNzaW9uYWxseQ0KPiA+ID4gZmFpbHMgdG8gbG9jaywgc28gd29ya2Fyb3VuZCBhdHRhY2hl
ZCB0byBjb3ZlciBsZXR0ZXIgaXMgcmVhbGx5IG5lZWRlZC4NCj4gPiA+IE5hdHVyYWxseSBpdCBj
YW5ub3Qgc25lYWsgaW4gYXMgaXQgaXMsIHNvIHVubGVzcyB5b3UgaGF2ZSBiZXR0ZXIgaWRlYQ0K
PiA+ID4gSSdsbCBqdXN0IHBvcnQgaXQgdG8gcmVjZW50IGRyaXZlciBzdGF0ZSBhbmQgd2UgY2Fu
IHN0YXJ0IGRpc2N1c3Npb24NCj4gPiA+IGZyb20gdGhlcmUgaW4gYSBzZXBhcmF0ZSB0aHJlYWQu
DQo+ID4gDQo+ID4gSWYgdGhpcyBjYXVzZXMgYSByZWdyZXNzaW9uLCB0aGVuIHBsZWFzZSBmaXgg
aXQgYmVmb3JlIHNlbmRpbmcgaXQgaW4uIElmDQo+ID4gaXQncyBhIG5ldyBmb3VuZCBpc3N1ZSwg
eW91IGNhbiBjcmVhdGUgYSBmaXggcGF0Y2ggYXQgYSBsYXRlciBwb2ludC4NCj4gDQo+IFRoZXJl
IGFyZSBmZXcgcHJvYmxlbXMgd2l0aCBPY3Rlb24ncyBEV0MzIGltcGxlbWVudGF0aW9uIGFuZCBu
b25lIG9mIHRoZW0NCj4gY2FuIGJlIHJlYWxseSBzb2x2ZWQgd2l0aG91dCBkb2N1bWVudGF0aW9u
LiBIZXJlIEkgY29tZSBpbiB0cm91YmxlIGFzDQo+IFN5c25vcHN5cyB0ZWNoIHN1cHBvcnQgcG9p
bnRlZCB0byBTb0MgbWFudWZhY3R1cmVyIHdoaWNoIG5vIGxvbmdlciBleGlzdHMuDQo+IENhdml1
bSB3YXMgYm91Z2h0IGJ5IE1hcnZlbGwsIGR1bXBlZCBhbG1vc3QgYWxsIHRoZSBzdGFmZiBhbmQg
dGhvc2UNCj4gc3RpbGwgcHJvdmlkaW5nIHRlY2huaWNhbCBzdXBwb3J0IHdlcmUgdW5hYmxlIHRv
IGZpbmQgYW55IHJldmVsYW50DQo+IGRvY3VtZW50YXRpb24gaW4gcGFzdCBmZXcgbW9udGhzLg0K
DQpUaGlzIGNhbiBiZSBwcm9ibGVtYXRpYy4uLg0KDQo+IA0KPiBTbyB1bmxlc3MgdGhhdCBjaGFu
Z2VzIEkgY2FuIHNlbmQgb25seSBoYWNraXNoIHBhdGNoZXMgd2hpY2gga2luZGENCj4gb3ZlcmNv
bWUgaXNzdWVzIGZvdW5kLCBidXQgSSBkbyBub3QgdGhpbmsgaXQgaXMgdmlhYmxlIHNvbHV0aW9u
LiBUaGF0J3MNCj4gc29tZXRoaW5nIEknbGwgZG8gYXQgbGF0ZXIgcG9pbnQgYXMgeW91IHN1Z2dl
c3RlZCBhbmQgd2UnbGwgc2VlIGlmIGFuDQo+IGFjY2VwdGFibGUgc29sdXRpb24gcG9wcyB1cC4N
Cj4gDQoNCklmIGl0J3MgaGFja2lzaCBiZWNhdXNlIG9mIHRoZSBsYWNraW5nIG9mIGRvY3VtZW50
YXRpb24sIHRoZW4ganVzdCBub3RlDQpob3cgeW91IGNhbWUgdG8gdGhlIHNvbHV0aW9uIGluIHlv
dXIgcGF0Y2ggaXMgdG90YWxseSBmaW5lLiBUaGVyZSdzDQpub3RoaW5nIGVsc2Ugd2UgY2FuIGRv
IGluIHRoYXQgY2FzZS4NCg0KSSBub3RpY2UgdGhhdCB0aGVyZSBhcmUgbWFueSBtYWdpYyBudW1i
ZXJzIGluIHlvdXIgY2hhbmdlcy4gSSBob3BlIHlvdQ0KaGF2ZSBkb2N1bWVudGF0aW9ucyBmb3Ig
dGhlbS4gSSBtYXkgbmVlZCB0byBtYWtlIHNvbWUgYXNzdW1wdGlvbi9za2lwDQpyZXZpZXdpbmcg
c29tZSBhcmVhcyBiZWNhdXNlIG9mIHRoYXQuDQoNClRoYW5rcywNClRoaW5o
