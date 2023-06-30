Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A16E7444DF
	for <lists+linux-mips@lfdr.de>; Sat,  1 Jul 2023 00:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbjF3Wcu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jun 2023 18:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbjF3Wct (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jun 2023 18:32:49 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB3C3C01;
        Fri, 30 Jun 2023 15:32:48 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35UIPlZH009761;
        Fri, 30 Jun 2023 15:32:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=kfYhetgz0noLnEf0AMlEqk4dhRl+NjB2i5VTvnAe9Xk=;
 b=o+05AtbDfi+mQQDOnyiS3BG65FGMkMg1fKCjSwi7tNDaRO7z0/4hNSz8aPUOGAlOnbsL
 iP1ciDgjeSh3Hx6RngLbr/p9sz8RHKHyrCjdwfeUWmsOE5O0S/JP36+S4f16BnWAkqH3
 qwIwHm4eB9Nxe4NQpd+5XGVsElnArX4oAM+5OU6xf09fbYLt6tZ+vyu9gmR6OTnWFKqs
 YX+57SkOpCGuADoPxd0b09NoxD44L/QpbxZlgRGc8XDKF1Uue7UcSIonIvBJy/U20ZlT
 9Hb/PUq6CeDS7UR1uYpgvn0EMMiaf4j0aCSYPuGk1rk+b8AEkAbdn5gDTeE4VIsw40fR lA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3rdydujujw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 15:32:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1688164363; bh=kfYhetgz0noLnEf0AMlEqk4dhRl+NjB2i5VTvnAe9Xk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=jJJ7xM6dofUolytK0UPksZgry5RYlS1crDNjSghwzhrCOQ+8cA9nRB6H7Isz6bNtU
         Z1HdyVnglhVOuoZi8Jl0i1tg5dgmG1P1FNbOUi2EzpDWt0QMs/dxKlz9Y/vPRt/VYg
         e/uYVOpxC7lPWW3wVi8pn0v/JH9OVV82oNWx+fBZGaYRZ29YE7LfqkjW9fwDbjAVnV
         xPXzrkzJ6sXVkh7l+BKc/ESIP2y5cbyH1VU5lz84Yg0xRMbHVk6vNzb2l4JlQYlNbE
         NUQOB0bcpg8ysfEnkMvNLL5tYxeuiO0ZMVuBMlKp9rQfSZw1iLiPMhswCGf6s0t907
         CHhq+SuTFdUkg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8821E401DC;
        Fri, 30 Jun 2023 22:32:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id A6558A01C3;
        Fri, 30 Jun 2023 22:32:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=kpbrn4oU;
        dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 714DB4061A;
        Fri, 30 Jun 2023 22:32:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j2zPvAv2jh1JhUQbqO27HU4m4BSEQepOYQgL5Qv02s63RYBq/nKsq51fDz/StDSgjXeemfoyCZ8mol+HB2NXyJhY2mSbCIEc4ub+vpBoqUe7t333R7G6z2oNMTfNIYpfeD6y406npeUnTJAtA/VneiDyiDLu7GC1nKUu2QGLdnW4o+LfArtfSx1q89h2+q/LiUNxNPtqVpy2WN9ewZJI/IRuP9KEd5754jdBrGTQMvJqaTQDdwECXB6Zo5z3LqhQAt71EyIDtjCHtCGpEvbaDeqvr1/Lx3HafGkN6VzfOx38LxwjMVRw050axjOw1lVBgDsx8nN6Tf77R1KLlG903Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfYhetgz0noLnEf0AMlEqk4dhRl+NjB2i5VTvnAe9Xk=;
 b=KtO8y8aHMkO34lh+rTQsVAhtzD3SEz+Rz36i0sxexy08YOj80HElz7oKd07m0WNVUxAE6jdEfpzDIOrHJfRXzVzVZmjG00Dy7ddcAalYbM1wn/62kjWCfmyy31c6Ul9H+jY8PCZvGft3jmMxZ8vhTEdxlHLzcqfK18ZA+ICuSHdKQP+44NMorkrXSg3xqdTHuyb43vgGdjmjOHE6TvVkw6mlcuJAxxP0Pnle1ldfAd/NVL3cFi8ZyQsyZ9EFXHxl1WlEnPDgnLdRmXeLQe5/uuHVY6IcaTplf2q6KFtRQ8j8VG7wxLqcji+FhyxS/hYgkQ2SN1r5XNPrir/KAPy9KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfYhetgz0noLnEf0AMlEqk4dhRl+NjB2i5VTvnAe9Xk=;
 b=kpbrn4oUB7Zbp6wSjZTb1zkHFyRPGSY/tMrw4Nwk7LhFk2GtosTWH5sR+wGSM/muaMx3RWtKrUckJqYIfp9doyvZyhhsXyUAOV5n8W/EKIOQGXPS2h7tm1hdIzcKU3GcS99spA1VjQa17M1CmI4yaKx0NRSp7E4xF9YvLa/tqmc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BL1PR12MB5205.namprd12.prod.outlook.com (2603:10b6:208:308::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 22:32:34 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b%3]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 22:32:33 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 08/11] usb: dwc3: Move Octeon glue code from arch/mips
Thread-Topic: [PATCH 08/11] usb: dwc3: Move Octeon glue code from arch/mips
Thread-Index: AQHZouqvvbURHVGCFUKuiy9+JayIcK+j/60A
Date:   Fri, 30 Jun 2023 22:32:33 +0000
Message-ID: <20230630223230.63qi7keyt2c6iobu@synopsys.com>
References: <ZJC165p0Mj4jHcBh@lenoch> <ZJC3LLpUlatnLdnv@lenoch>
In-Reply-To: <ZJC3LLpUlatnLdnv@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BL1PR12MB5205:EE_
x-ms-office365-filtering-correlation-id: 5782d2ab-a6a0-4009-7eec-08db79b9e5d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4FE2LE+T6B3vo+jglg0/9JWEUXdVoHIgjbJpNuyzatUlo1XQ2WRnDM9p/dY/zMDFP7sFwdhpR6aF08qBpM5mDvqnv+mVv9FtvAXMUENjT/ZXtdfYQuQjUapzKB9gleuKsEwUHbWCqETo/t+wjXZj4KHNH/FAuPIER1J38OO/OdW6A2+ldPuJolDbnQR6I3Spa5qVSm5s5fEmMY0LISaTjIU1OqsxABHQRIj066IjvRuq0+G6oYQwVhvLcpmLc2hNEi7JVdTslJQIwceMZRM/jinqN/FCvmquzVMavhhBvvQkTr6by2rm+ur7noe4lwNFUZvm1at45z5+JFW4UAAG4mUCe2rXSCNNMorCZOLmKa8GfsFQSisLMo3Izf9Sky/DxWUJxtcjh+sf1JWEBwUIBQRS09OV9hj/o1nK9gXVYopNK9La/Fx6+cGtXbf1b6g1VAYxWo16MuLYAq49MBJYODE9vLzeacEGm/hm1utj5d3UE7GKWBEifNukOOHRl190XCGMkripgWP8iNc2xtUKjD3tn6gGn+xEOZ2/BoDD9spAwQ0i8f3zUbDzwhfBUSnHk5BVlfPXN2fn8fEzV5/TC+WYOcE4MT63MR7LI4csc2KbBF1n89wGTK+xdJFubK2u
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(83380400001)(38070700005)(2616005)(2906002)(122000001)(38100700002)(36756003)(8936002)(8676002)(5660300002)(86362001)(71200400001)(54906003)(6512007)(41300700001)(76116006)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(66946007)(316002)(6486002)(478600001)(186003)(1076003)(6506007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUJmcU9zOWhacTlPY3BIdXFzcktQVTR5TEtjS3oycUZVNm9aYXdaMVdNNUdl?=
 =?utf-8?B?K3R0eFdiUkMrOStkS0d1cXdtQ21iQ1VyZkphaGZzZlgrUjlFSXZVcnRDL0Z3?=
 =?utf-8?B?VVp6Wi9jZmpjTVJJaDM3aFVSMjAzeVJhdTVua2FjbmhyQjJ0Q3k2eW16T3hZ?=
 =?utf-8?B?eENvakhERVl3cHlWK0o5RThvclZDbW9QWG5XTnNaVWNTOWdUL2lNYWJzWUU1?=
 =?utf-8?B?a01xOExwaUFUVHhwMDRkQThNNldsRXVaYW5jUFJ3ZG5NUGpKOGdYRDlta3BV?=
 =?utf-8?B?TzZvVkJUTzZQT3NLTzVuamdTT281N05tWk1TZnhwMUlRaVRuTmwwSVBXRExM?=
 =?utf-8?B?ZDNwWTE2MURSTlVxc00wM1NDcEhNY3ZaN2ZGMmxHQml3M0xsb1B5b25uQzh1?=
 =?utf-8?B?clR6SFduNHFneXZTMGFrR2V0bXFBV1ZleTFzTzdSdDdqcyt5cFBramxpcW9D?=
 =?utf-8?B?RGt3MGRGeEt1NVEvQ3ZPQm1rUzJJbDFaSUFGNnpMZEpBM3EzSGkyUk9JRmNO?=
 =?utf-8?B?R1lJU0RoTFhLanBsdDVXUFlDRnN6ZUtUVUR5VWFITTV1RWFhaTVkbVQwcFk0?=
 =?utf-8?B?MU53bUFxdUMwSHlqNHRRQXE1OEhvNWpoc0I5QUdQOFdYQVJRb2l3aHBhTmE3?=
 =?utf-8?B?UEUvcjZYRm12WllONEkxT01ma25kQlR2aXBUVFNXam1qVGR5RVl3MmhrSXZT?=
 =?utf-8?B?WS82YVd0RGErVFgvb2Z2MlBINlJBMWt6eUZ4aXIrT3NzREJpNTBhQ0o1T2Yx?=
 =?utf-8?B?bzdKTS9MNUN0dmJUOURRb0tkRVQ5MVFkL3ZFbnNWZ09pUk4rUjFsZTFjVVRs?=
 =?utf-8?B?bmVTTmtMWHJZR0hPa1MwbmFLYWg3TUlpMVJNdi81VnlyVW9FdlNoMUg5OHd2?=
 =?utf-8?B?V2RDZ3Z4MlBwWmprTUM2NUJtQ3luVlNJbis5VWgrU3lUVEtXWHJQMDdhd1FN?=
 =?utf-8?B?OVpzSWxOWFZVVXYvSjd2WWZBTys4dEtrTURudXhxTEN1MEplN2pvSGJVSU9w?=
 =?utf-8?B?QjBVUDE1SjN3Vlg1M3ZJZHQ0S3o5ZURlK2NWVUExSGVSRDhHOGxuanhPSW9G?=
 =?utf-8?B?NVR3K1Bzd3RhY0tTREpBWS9ab0VCTXFLZGN3SUI4Z3pHUWR3ZEdESDIzeVRz?=
 =?utf-8?B?RW9aNjVDR2lCZlpOQ0NEWEhSVExqbTN5b3lrcTI4L3YyTElReHg1c0UybEsw?=
 =?utf-8?B?MmlkK2RWZ0hBWkVNWWRYZ1E1eC8vcStFT3BXYnU1MjhkSUVJVUM3WEZEcVJh?=
 =?utf-8?B?NXpORk5SL1JnbnZ5N0lwTnJmTDA0WEt1Y2x5S1AxSTRrbExnbDVnOE1JajNh?=
 =?utf-8?B?WnpNdWM3UlVxT3J5Rld3SDJOcWpJWE5LSURpK1ZqUi9EWm5laEcwYldvQnZN?=
 =?utf-8?B?TmJRaEtRMWo1Z3pOZWxiR0tKakVZOEt6cFk1WDlSUHlIbVhrd2ZKR2VmK2cx?=
 =?utf-8?B?a1Jjdll4Nm9YM3dXRFUrTzMzMTA4RjFCZFU5ckQrd0pXZHhXQjRBVTR0UC9D?=
 =?utf-8?B?S3RvVHpQR1ovVnlrSHpvYzF3Ym5jYlpOQWExQ09EZ0lBNUNPazFFdFFKQmky?=
 =?utf-8?B?QUhxa1RnOWIvM1RHc2tnTU1IYUVGMkpyMFpZOC9TUmVlRm85Z050V1lqbVIx?=
 =?utf-8?B?Z2RZQTNTUm5tMHI4TWwybkwwYkdqZVR2akthYytqNVJDM1FBdTRvMFJDazha?=
 =?utf-8?B?MDlMVDlYSFJ4K1A0Mm5mT0RWVjZsbXRMaTJrcmZOdEliZk9OWDNtTUFpcHA5?=
 =?utf-8?B?NVJMbXYzK1RZdkJjTEg3bThJbVV5b1F4SGpwZGQ3UEtJcTVadzNRalpZck9C?=
 =?utf-8?B?Zy9hNFR5OVRPYm92dEYwbHpUTEoxbndqYnFHR1hmM0hoZ3BlWmlRNXZXQ1VW?=
 =?utf-8?B?T3NlTmQwNTBYY3Q5d3p3K21TTFF2a3VLMExBS1c2UXkzd2wvY0wxV0FBbERL?=
 =?utf-8?B?cjZocHZYNXpFYUtQTkIvM2VLY0xkaDdFRjdacXZlSVl2Y2Z0eUJJbU9uZktZ?=
 =?utf-8?B?b0FYQVNsWHVkcmYzQUFCVnNRR1d1aGlhZnNhUE5SR0htRnJwRU5EMDhFdlIz?=
 =?utf-8?B?RzRRSjI0OEZIb2dPLzdsVVN1aTBGa1FsQTl1ck8xeWhJTk1xa2x5U2cvUFlS?=
 =?utf-8?Q?xeQbKzMlbvBzdnN7qNBw3z5Uc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE6CB1683C773D488E72AE352627BD53@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Vs35dGuZNcJ3bShw/OYKkmtZpgAY6BiZF4GTptbmrsgY18DGi+dWiSWRO7OpKEoyjMq3S14ce6M2jEnraiLh9Q96e7nio2Kt1EzsUANZe7tlHvnpSqoTqGQU7PJhDmDXKVWyRyY4YZi8ql1uWTgX3Itp9yhFJ5AYSCkAhIXb3rXlfjIPll26cQjZTxlur/i/HdnXrU3Cm5Bf8jNx92rwHKxg2DbZoPJuHWlHN01qgJER7Xi13PoqhUmMWJu1iV0aaYKtD/+yeyamsRtDrEDgLlurwyZ+Swm7qHKOFqnB73STsGaWVIsnQ5YyYiKgZUrr+rfNusSGmbHPEZXrkvYngJzTrQ+RzKn2F2wuG/ljl+6vOWjJRLj30WJ2e5pW+IIWMJI4EtChnworm5YEU0/bQvpzC0GwR/hWU02qPFfCuWGrHbCLcgnWscAtQ/BaJ5Q9qYa4v7juKvtZq/QRMuo2JE4NJTTh0xq18ViAWEFSGAIUk9YG/Qo+xDkYCGoIFgg9ApCdmxwWUy6flcvCU8jLBAAZylg754o9aEMEnUnp1yj7lRhmhqzflIDhRIEPGsYzvG854xeLpyOmjPK20t6KsRmSk47a3putvDdeYnk/uD16cXutCNkwf+7ME2SmV53AdRQ9i++GcfquptV1jSdQ9XC+MCaMIrbzhfVk5YGrykt5fTRgpRDBpyRLmbmTahrSJsH1mDl7c4mbtUOZPmwY6lAbOO8Ib7QpcT5maNNLQxGSjn6Z0IoKuVVlzYqmZluPveCk4KLlj8Telxx9N1WOXjPK14LQiPJE9Ut/MoZtfpx/AYzJXd4BsTzXLBKQvIrI4Jz8XPbyA4K5kSlXxpZz5w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5782d2ab-a6a0-4009-7eec-08db79b9e5d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 22:32:33.4716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ZbDKmlf0QVzjCqgVbykdfX3mo+PLbcFVs5BUtaQhkkfXCCVC5M7ze18R1Xikj2mw9DBxJs+i+qR4mxrcJhyFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5205
X-Proofpoint-GUID: f6r-p3FapIAyHfVctJNbeN2BcBUiIY0Y
X-Proofpoint-ORIG-GUID: f6r-p3FapIAyHfVctJNbeN2BcBUiIY0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_12,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=899
 impostorscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306300197
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gTW9uLCBKdW4gMTksIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBGcm9tOiBMYWRp
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBPY3Rlb24gRFdDMyBnbHVl
IGNvZGUgbm93IGNvbXBpbGVzIG9uIGFsbCBwbGF0Zm9ybXMsIHNvIG1vdmUNCj4gaXQgdG8gZHJp
dmVycy91c2IvZHdjMy4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTGFkaXNsYXYgTWljaGwgPGxhZGlzQGxpbnV4LW1pcHMub3JnPg0KPiAtLS0NCj4gIGFyY2gv
bWlwcy9jYXZpdW0tb2N0ZW9uL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAt
DQo+ICBkcml2ZXJzL3VzYi9kd2MzL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDkgKysrKysrKysrDQo+ICBkcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDEgKw0KPiAgLi4uL29jdGVvbi11c2IuYyA9PiBkcml2
ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMgICAgICAgfCAwDQo+ICA0IGZpbGVzIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIHJlbmFtZSBhcmNoL21pcHMvY2F2
aXVtLW9jdGVvbi9vY3Rlb24tdXNiLmMgPT4gZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5j
ICgxMDAlKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL01ha2Vm
aWxlIGIvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vTWFrZWZpbGUNCj4gaW5kZXggN2MwMmU1NDI5
NTlhLi4yYTU5MjY1Nzg4NDEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9u
L01ha2VmaWxlDQo+ICsrKyBiL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL01ha2VmaWxlDQo+IEBA
IC0xOCw0ICsxOCwzIEBAIG9iai15ICs9IGNyeXB0by8NCj4gIG9iai0kKENPTkZJR19NVEQpCQkg
ICAgICArPSBmbGFzaF9zZXR1cC5vDQo+ICBvYmotJChDT05GSUdfU01QKQkJICAgICAgKz0gc21w
Lm8NCj4gIG9iai0kKENPTkZJR19PQ1RFT05fSUxNKQkgICAgICArPSBvY3RfaWxtLm8NCj4gLW9i
ai0kKENPTkZJR19VU0IpCQkgICAgICArPSBvY3Rlb24tdXNiLm8NCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzMvS2NvbmZpZyBiL2RyaXZlcnMvdXNiL2R3YzMvS2NvbmZpZw0KPiBpbmRl
eCBiZTk1NGE5YWJiZTAuLjhmYzdiN2ZmN2YxNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2Iv
ZHdjMy9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvS2NvbmZpZw0KPiBAQCAtMTY4
LDQgKzE2OCwxMyBAQCBjb25maWcgVVNCX0RXQzNfQU02Mg0KPiAgCSAgVGhlIERlc2lnbndhcmUg
Q29yZSBVU0IzIElQIGlzIHByb2dyYW1tZWQgdG8gb3BlcmF0ZSBpbg0KPiAgCSAgaW4gVVNCIDIu
MCBtb2RlIG9ubHkuDQo+ICAJICBTYXkgJ1knIG9yICdNJyBoZXJlIGlmIHlvdSBoYXZlIG9uZSBz
dWNoIGRldmljZQ0KPiArDQo+ICtjb25maWcgVVNCX0RXQzNfT0NURU9ODQo+ICsJdHJpc3RhdGUg
IkNhdml1bSBPY3Rlb24gUGxhdGZvcm1zIg0KPiArCWRlcGVuZHMgb24gQ0FWSVVNX09DVEVPTl9T
T0MgfHwgQ09NUElMRV9URVNUDQo+ICsJZGVmYXVsdCBVU0JfRFdDMw0KPiArCWhlbHANCj4gKwkg
IFN1cHBvcnQgQ2F2aXVtIE9jdGVvbiBwbGF0Zm9ybXMgd2l0aCBEZXNpZ25XYXJlIENvcmUgVVNC
MyBJUC4NCj4gKwkgIFNheSAnWScgb3IgJ00nIGhlcmUgaWYgeW91IGhhdmUgb25lIHN1Y2ggZGV2
aWNlLg0KDQpJcyB0aGlzIGZvciBkZXZpY2UsIGhvc3QsIG9yIERSRCBtb2RlPyBXaGljaCBJUCAo
RFdDX3VzYjMgb3IgRFdDX3VzYjMxPykNCmFuZCB2ZXJzaW9uIGlzIGl0PyBUaGUgbW9yZSBkZXNj
cmlwdGlvbiB0aGUgYmV0dGVyLg0KDQpUaGFua3MsDQpUaGluaA0KDQo+ICsNCj4gIGVuZGlmDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxlIGIvZHJpdmVycy91c2IvZHdj
My9NYWtlZmlsZQ0KPiBpbmRleCA5ZjY2YmQ4MmI2MzkuLmZlMTQ5M2Q0YmJlNSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2Mz
L01ha2VmaWxlDQo+IEBAIC01NCwzICs1NCw0IEBAIG9iai0kKENPTkZJR19VU0JfRFdDM19TVCkJ
CSs9IGR3YzMtc3Qubw0KPiAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX1FDT00pCQkrPSBkd2MzLXFj
b20ubw0KPiAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX0lNWDhNUCkJCSs9IGR3YzMtaW14OG1wLm8N
Cj4gIG9iai0kKENPTkZJR19VU0JfRFdDM19YSUxJTlgpCQkrPSBkd2MzLXhpbGlueC5vDQo+ICtv
YmotJChDT05GSUdfVVNCX0RXQzNfT0NURU9OKQkJKz0gZHdjMy1vY3Rlb24ubw0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXVzYi5jIGIvZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLW9jdGVvbi5jDQo+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQ0KPiByZW5hbWUgZnJv
bSBhcmNoL21pcHMvY2F2aXVtLW9jdGVvbi9vY3Rlb24tdXNiLmMNCj4gcmVuYW1lIHRvIGRyaXZl
cnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiAtLSANCj4gMi4zOS4yDQo+IA==
