Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B0D754469
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jul 2023 23:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjGNVqh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Jul 2023 17:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjGNVqf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Jul 2023 17:46:35 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6BB1BDA;
        Fri, 14 Jul 2023 14:46:34 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EGik4m011234;
        Fri, 14 Jul 2023 14:46:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=ESIRdnHdkDvGNMtPh3EJo5RG051YDBDNW/Bt9eX0QSc=;
 b=t33KtpWumahKABhh0SfHnFH4ZefNEyguGJ64hSRIRQPpOdiO3bNpt1Jor+KEun2lc6bl
 Gq1lrszi0SnWL7V0yl6RWQnhuEbERbB0s052TxCpXQ5qhsjSTzZXujk9FGMYkNB51EDc
 9Y+uWFWXjScpMnBl1O3ilRbq63IHCpyrTUsfaMx0PUqX1PLUYmyM70Z+Ss5UgM6QaMA2
 IGpLAbe1Myztp/2x+ahMiDoL3bU6e90JBpCaaC6qf+Vyz3B0u0MERYiea1yu7B7Leu+a
 Ukt4+vTe0Fr1VU9T9INrpiVwoZJCoJP8scY7jTbD5lBk3w4lp/rFSJ3WgEno0eBGvL77 cQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3rtqq8dt0g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Jul 2023 14:46:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1689371184; bh=ESIRdnHdkDvGNMtPh3EJo5RG051YDBDNW/Bt9eX0QSc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lrBHXMcsd/Rcky2F8cAMzzGoJe84Ue69fANPWF/cfa50UH6Cv3MMSOjP45wDbKwJC
         DMGxOQrXOt0NoI2SfUletE5Un7pZlQLxwxPxRJGsPIVV00D2UBcyvLWL4WxXH92VSy
         hSQaTX58I4kjazEAxKHYPIknYbAIlLvxMyn82/QVCXfiN66PppXH8KyEOyiYjOflAO
         KAcmef2vVf+tyDYaNOqkIlXFz8lpYActKt0xlWB3HvjntsajoG97ijjCEC005+oyPC
         Egy2CCIrQ/tgtbr5NcbRhMRuNHrCAP0kJzKKT/ApFmcQDHc+eMUCXHwpprYQzfzrV4
         3v6qdoOjQ4agw==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C9F134011F;
        Fri, 14 Jul 2023 21:46:22 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3FDE3A0080;
        Fri, 14 Jul 2023 21:46:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=VwT97ycO;
        dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9144540688;
        Fri, 14 Jul 2023 21:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuLatPkJILW1HEEirw3/f1f1/uyqtPrKQ0jdM3mSl283NRQZe5h+V6Bna9qtifqWvu8V7I3zguOiRF5JTdZMuZBNGYtFVeDwsecqJ9pohKaEBTM0jx9EVZmqfEVZKQxQSZcUqYfJ0saOncFWefLInew3uLMl07Bv6Y4hZcfIk1RC4LJznCung+F9puwPdlgz9eDhVCIaV4rHIlPqS/hJcZzNpcDTk5jh7cJEm9TC7lkXQv7kD0uxYhdpu0K2oa/leeI0rbSSIVu5ZQ5VPf5kvVDFznaivz5XA9IcpqJ7H6SiLC8ree8yNPRm7YMUhbNUpeZPUVPu8wQnEKPQJLnhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESIRdnHdkDvGNMtPh3EJo5RG051YDBDNW/Bt9eX0QSc=;
 b=EaP7OG5QTbKAlNi8LHao7WYiTZsB7pOWf7SzgXEat3sULRBF/Qz5UDdsqPh+U0AIseieAq+cta5cqd6RySd56o36yr+Uz0mOOiNRSkFn6LHpc5OY56fvfAAh2o9KEdoXJ4Xr85DDuqea5l8sefHJm0kMbqnmgI/DV0ZxH67vmedMw4rrV5Pe0xRRm84ENTVsLSABdKVZU6PGbhVXD9hTvLPw6VrxDWR/zAec5etxxSfasZwXIHmrxQRgaoK9UMd29IgDw5or4+Cb+RNt4KjrO+CxEvxDix2AMWeM3fy5mh//PxKkShrq2nRBTobNfIndrKTbiAiHYUWuFACbLzCTwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESIRdnHdkDvGNMtPh3EJo5RG051YDBDNW/Bt9eX0QSc=;
 b=VwT97ycOhpyyr4v1iTr7pNkIAE8YJBFbAncoZlGIuchMq1GgqXv8SdAx8gkGkUF1Iy6f+K9qysb8yGbWIJOieMAQgwfz2zFqHYWQeARMEgntmWUBq6CsNpJvQ8S+7kmI2NS/EV7RJKlKiC0iWD3tj2Tow0Qn2AOTaZe6hYKPC8A=
Received: from BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Fri, 14 Jul
 2023 21:46:13 +0000
Received: from BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::7a8:9367:70bf:2491]) by BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::7a8:9367:70bf:2491%6]) with mapi id 15.20.6588.028; Fri, 14 Jul 2023
 21:46:13 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] usb: dwc3: Add SPDX header and copyright
Thread-Topic: [PATCH v3 3/3] usb: dwc3: Add SPDX header and copyright
Thread-Index: AQHZtia31p9a8Gu26E6ZiXykIuocqa+5zOWA
Date:   Fri, 14 Jul 2023 21:46:13 +0000
Message-ID: <20230714214609.cemmrkkfvw6p2toz@synopsys.com>
References: <ZLD7RHvE4eRPoqKN@lenoch> <ZLD8RkrgU/A9pZMf@lenoch>
In-Reply-To: <ZLD8RkrgU/A9pZMf@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB4787:EE_|CYYPR12MB8962:EE_
x-ms-office365-filtering-correlation-id: 376e5fa7-6911-4a67-0e29-08db84b3be78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vHmudys0oX+h3ibHXus9V48NNVkL5JkG2R7sN8emw/sUEQg41KBKLt0IyGNE1K+l0GHx+dA7n4AFXeVR02RiBoWvbnMJtW2uCGXTXSQRrppjLyNrM0k8lkYjYNJ2dxd79dgU1kT7WdIfKabbPfy3geNubQ05L5ibtLfjgPi9S6HyDQm/0jm72d0i/8IRtzKOsKOy5EIWqiTnLh0ER6AjT6trxmfS1J3gGXxXj3BMTL/pNQH/eWQPR4uzrTi2ZfrxxN5KGFItmYzR2v2wj23KCQLKkYxuTD9mqz5Ncilr1wIbV4jpFjs7Y6Fwq5+ftRUYvHQzjVRfgygFZSeUbq9nhjM3XFkFOk3AiOntTGuNm8Z27D4c3eqAHed45hgYqJcni/oYbbrSREnxvAG0ovcdsEpKbDQXCXMpS34ImCUIXSDdJvDksvL56Z2VJkMRIl2a1JRxMVAxqt8EzItkjJsFteo57PMbSrI62WP99SNxC7/AoLr227EYZ6Mr42MYe6KVCRgizy6J9VvdAMuFaEYr/KDtaojrGgt1+UtuLFB178x4X8VBfQ0vNVuTilMPu0qRZYKveLXDUtwKjIVadonasUzIvPpKxms1tQP0lspiGZukNhXdIlXv7OldQMUOnfFv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4787.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199021)(36756003)(186003)(26005)(5660300002)(2906002)(2616005)(6506007)(83380400001)(478600001)(71200400001)(91956017)(54906003)(41300700001)(316002)(8676002)(6512007)(6916009)(76116006)(66556008)(66476007)(6486002)(66946007)(4326008)(64756008)(66446008)(8936002)(1076003)(86362001)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUVyK2R3enFiVmFBVW1yMEVvOG5RK21PcnBicFNWQ0JYdjFsK1dFbFNYdW1D?=
 =?utf-8?B?c1U2UFk4a1ZIVDc0SkpjQXZ2ZVRFWXpJUFpyczNNSjlzYlZjMS84V0NsaUh0?=
 =?utf-8?B?a2d5QzhvODFSQXAwejRRTFB1aTlMa0xQc0xkdWRDQ004QU5xOStiMHpGbjhN?=
 =?utf-8?B?TmV1R21wNkQ4Y0FadnRwa09Mc2kwWE9NVHlZKy9IUU5PODdWUHVBekFVYmJo?=
 =?utf-8?B?ZGVObGtjcHNPK01xWDBxeVp5Z1g1ZlVUbmFTeVo1Vk1CUit6bXdhWjgwYUMx?=
 =?utf-8?B?d0l5ZGtqOHV0em1GdndrdXppRUZsUldZckw3bjg2L1pCZk9vanlwaFhNME5i?=
 =?utf-8?B?bWsva0d0NlJqOE1uZ0d1TkFiTHlsaG53ZDBSdHNvdUlEdzc3YVBOYnV1OUtR?=
 =?utf-8?B?MkV1OForR3R4a1hnY1YwdElZYTlxM08yVVBzWUxlbW1yT2lkajJ4cjJXK2dF?=
 =?utf-8?B?QURTYitDZ3lKNTJuZE14Sm1rMGhLdGZGWHBRRWlRQzN4MWpzYUlvWUZFMHJi?=
 =?utf-8?B?a3pGYlI0aEFnM0ZCN1ZoZXl4dW5KbTlkcStxM2lvdkh1TENQVTIydmg1S25Q?=
 =?utf-8?B?Y0ZVR3ZNRVlVV1pCV2swNHlyT3NVaTFleUpVYzRHdG8zdmthZm04TnhWcDFQ?=
 =?utf-8?B?T1Nob0gzTzNaMUJrNThDTUVGczVlK1p2T1ljNEdpZ2N6Um9Fa2RMdkNkUXlx?=
 =?utf-8?B?MENLVFI2RDc2Y0JndXIzN0RlRldlbEQ1aytWN3dKTFRqRFc2dzhBbFRCTFlm?=
 =?utf-8?B?cUdrVkxrTGRxK3pYUmFzQW95UXZxRDQyNHpDcjJ6TFFVazQ2eS80eTRMaUg2?=
 =?utf-8?B?M0JoZlRvNzNJSGt3UE82eTViYTB1bDNkUHhuZElGU0NUY3lkTGFSY1NQcHRp?=
 =?utf-8?B?OXh6dzRBQ1dvMkMwQkYvVS9qVzdNRTJaayswV0oyU203dnpLcDN2S2N2YzFK?=
 =?utf-8?B?d3Nua0F5ZWdmSWplZnIzKzhKWWpmT1FVTVdtT0x1Qi9YMklPNTZ4V1Bzb2R1?=
 =?utf-8?B?ekZnTVFOT1p5Rkgyb3Q4ajIzNnJZZjFNUVlZVndta3UyYnhHM0J5emprTzA2?=
 =?utf-8?B?WXU0ZlcxOFJRWCsvR0V2aXVYbHdoRGxNaFo5MjVSTlArb0VFU2tJbzk0blZT?=
 =?utf-8?B?emFTZURiRUFRNVpUL2xob3BwTW1admhYS3lxYlhGTzdidzBhOE82Rlh0ZzJw?=
 =?utf-8?B?aklIK3hCeDBFbXNRZmpyOEpQNzFDQUh3R1M1WWcxWEhiSTV4K1FGeWhGUWlz?=
 =?utf-8?B?WmJ0SVIreTZ3cUgyWk5nbi9EcXVITHpSOXZrWHkyeWZqNWNzOXVqc3lRWFp2?=
 =?utf-8?B?N1JzckNVcDNoN0dkOW5pbXBOOXhiSnk1R3Flb0pqYkwyL05kQ3B5YU1uOWlj?=
 =?utf-8?B?YlVTbDIwK2tHZVRPcXcxZDBXZW5EZGRUOVhQZW9JbkZ3bHBsck1hdDNXUk4w?=
 =?utf-8?B?K0JGdi9PVTV2bWdVWHpCR3A2RTZ6cjlJUjgwb0VGY0dpVUsyZmZBY0xjUTBP?=
 =?utf-8?B?emtMLzN6V3NZbTlUY25WdGt5UnBCa2Q0UlZSYVExZ0dvNFJmaVNiaCt5WHdw?=
 =?utf-8?B?ajl5Y0dsdU1yZmtORGhMcW02dWFDenZpc0Y3Q1VUVlJQaXhiVTdUN0I1NDdu?=
 =?utf-8?B?d1FjWEZPZU8wY2NGdlgrNStCVzR3K013NTNWK2tPOFU4SnF6R1pCdFU3cU8y?=
 =?utf-8?B?ekN6QnNKbXFGY1c0V3RPZExaNUUyOENGZEMzRWlTeG9pdHRZd29vSGM4RXRq?=
 =?utf-8?B?TncybVEzbTNxSkcrSlhtUXRmSkdibXg5b1gzZVVrZnpKY3VOV2UzVHNxV0ls?=
 =?utf-8?B?QUluU01vbGptTWFFcTlNc1dKdThnUjZXOXovaXgveDhBU1RRdFlQQzZkTksv?=
 =?utf-8?B?OUdiRHVsNHhMK3VqL3dWYlFubmZFTUxzREliNGd6TFNabUpCVHprS3VFaG95?=
 =?utf-8?B?WTFJK245L2gwWEF1ZldCaWpCUGdNcFhrTFpMcGZNdG9qaTRGNUZaWDF3SFRo?=
 =?utf-8?B?dVFHdGxZbDh3N0dsQVVqYWlQa3FQLzlFcjAzaE1nZlVsM2x6VXUyU3M0NTkw?=
 =?utf-8?B?TFVTWVcyam5SRXA5QXlyQlU4SkJoUSs2Z2FxN0FNUVk4VVptSmJGZHhjVGpy?=
 =?utf-8?Q?KJRYTlD3d7rbLlfre/QhZ8q5V?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E42C67FB2D55AC47BED1F201C43973AD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?VjNUQ3dRcm50cWNZMlE4VW5LQy9wSCtWd2IxSVBwRElGVkg4NFRURWZURDRT?=
 =?utf-8?B?UHlWZmpBdS80K2paUnRHSzZFR0czcEpYVTFOTE9XeFNNMlFVMTd2NXdmSXYx?=
 =?utf-8?B?WlZydjh3YzYwdkViZVVnUS9XNlAxbmZIaUo2ZlFsQXJJN1dWWldtWGluVUQ5?=
 =?utf-8?B?WHFFZDdRZ2ZZLzNabFR5dm5NU2ZOWHZ2UXB0VVBSYXhmZU93bk1zZG8rMFFY?=
 =?utf-8?B?MGJaSlBQcURPVTU1Q0kzQlRFSEtmTVFjb0VKSWNZVTRQQWJ5WCtJOFV3UW1v?=
 =?utf-8?B?WnJlL3hvRlplWWdCUUlBdHlkNnp1UTJ3aE8veFFSZzJhQkxGMVZUeEZtdEhV?=
 =?utf-8?B?TnF4QlJ3Q05XNEpLcnNQR05BaVpVa0p1STludDJQQlY5eUI4cG9OWVoram85?=
 =?utf-8?B?M3pWOXVGZGtDUUNjMWdGbFNjcGlDODJWc0lGWGlwWDFqZGV4YU9tcHFrTXVS?=
 =?utf-8?B?VnZoSWYxNFllNjdnTXZxOUVVdnN3VVZNVytBelIvS0VDbmlxM0M2US82bldZ?=
 =?utf-8?B?Um1rTWZIaGNIQi9DS0ZKRjVYUHBJY1Z2TXVkYThQb0VlbndZRnVmSktqcmc0?=
 =?utf-8?B?bVljMkdqRldRT3BDMjZpNDZwZkxudCt2UG1tRzJzQm9IWDV4TUtsSHB5QjJK?=
 =?utf-8?B?L3Y3T3kzOU16Q3NEUVBLSmxYdE8vdER0cUxPc1pxOXY4OWJQWTBYTityYnha?=
 =?utf-8?B?bmVBYjdWZGgwbmhNVUlDUGpqTUlFSEx4WTRUSXlIcUhuTm5RdlRZVWJYRnRa?=
 =?utf-8?B?QTlGME9OeHJBbVY2RnJZaHR6ZW1iMlpUTUtxd21CWC92N0oraVNFak5CbCtu?=
 =?utf-8?B?dEtUY2I5cUtGMVVQUFpZeHVqVGM5QVpoRi9RdDlFa1JTR0tFSTBaQ0NROU0x?=
 =?utf-8?B?RlVCZE5aR3ZaS0NWNnFJZjRJZUMwa29Md24xdGROU05sMlBDRnpNOVFrNUJ2?=
 =?utf-8?B?UG5ERTllZStjVUtFLzB2QXRISElIUEZCK2JWN1kzbWsyUmF1VUg4TkhtaEt3?=
 =?utf-8?B?TDdwdS92NmZXdmlmZTVvRTlCZjJUN2l1dXc5aVV5a3FlRkRSaGxDckZYbVFM?=
 =?utf-8?B?ajV5ZHNERTlSOUdJc3ZESW1TQVBSbFFob0I2T2xBbyticG9kcEdqQjQvU2k2?=
 =?utf-8?B?RGhqckh4b3BlbDBmTHBpRlZ5c01JVHdueEh1dXZzUVMyTjc0Mm41T3Zaa2ph?=
 =?utf-8?B?QkVQSVpteWpNM2Vib2dJck13Y3dHK21Ub2xLbFZOdit5cG93d2JDM3hhMnlz?=
 =?utf-8?Q?DoUAVOYxkUkVx5E?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 376e5fa7-6911-4a67-0e29-08db84b3be78
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 21:46:13.2464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CnPYpN8x28D0NX1Bpeq/h0jeFdz18C7V4fs2Zgjxm2r9g+YUBOXb1V/wqj54SMp/IFvUtPtQtmJzlb4ppHTLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962
X-Proofpoint-GUID: g24WFbXI8rBm-StTQpKIfpC2zw5IiQYu
X-Proofpoint-ORIG-GUID: g24WFbXI8rBm-StTQpKIfpC2zw5IiQYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_10,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxlogscore=899
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307140199
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gRnJpLCBKdWwgMTQsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBGcm9tOiBMYWRp
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBBcyBkcml2ZXIgaXMgcmV3
cml0dGVuIGFuZCBEYXZpZCBubyBsb25nZXIgd29ya3MgZm9yIE1hcnZlbGwgKENhdml1bSksDQo+
IEknbSB0byBibGFtZSBmb3IgYnJlYWthZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMYWRpc2xh
diBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IC0tLQ0KPiAgQ0hBTkdFUzoNCj4gIC0g
djI6IE5vbmUNCj4gIC0gdjM6IE5vbmUNCj4gDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0
ZW9uLmMgfCAxMCArKysrLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1vY3Rlb24uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiBpbmRleCBkZDQ3
NDk4ZjRlZmIuLmE2OGQ1NjhiMTFhOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9k
d2MzLW9jdGVvbi5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiBA
QCAtMSwxMSArMSw5IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0K
PiAgLyoNCj4gLSAqIFhIQ0kgSENEIGdsdWUgZm9yIENhdml1bSBPY3Rlb24gSUlJIFNPQ3MuDQo+
ICsgKiBEV0MzIGdsdWUgZm9yIENhdml1bSBPY3Rlb24gSUlJIFNPQ3MuDQo+ICAgKg0KPiAgICog
Q29weXJpZ2h0IChDKSAyMDEwLTIwMTcgQ2F2aXVtIE5ldHdvcmtzDQo+IC0gKg0KPiAtICogVGhp
cyBmaWxlIGlzIHN1YmplY3QgdG8gdGhlIHRlcm1zIGFuZCBjb25kaXRpb25zIG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMNCj4gLSAqIExpY2Vuc2UuICBTZWUgdGhlIGZpbGUgIkNPUFlJTkciIGlu
IHRoZSBtYWluIGRpcmVjdG9yeSBvZiB0aGlzIGFyY2hpdmUNCj4gLSAqIGZvciBtb3JlIGRldGFp
bHMuDQo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgTGFkaXNsYXYgTWljaGwgPGxhZGlzQGxpbnV4
LW1pcHMub3JnPg0KDQpJIG1heSBub3QgYmUgYW4gZXhwZXJ0IHdpdGggQ29weXJpZ2h0LCBidXQg
aXMgaXQgY29ycmVjdCB0byBwdXQgeW91cg0KbmFtZSByYXRoZXIgdGhhbiB0aGUgZW50aXR5IHRo
aXMgYmVsb25ncyB0bz8NCg0KQlIsDQpUaGluaA0KDQo+ICAgKi8NCj4gIA0KPiAgI2luY2x1ZGUg
PGxpbnV4L2JpdGZpZWxkLmg+DQo+IEBAIC01MzYsNiArNTM0LDYgQEAgc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXIgZHdjM19vY3Rlb25fZHJpdmVyID0gew0KPiAgbW9kdWxlX3BsYXRmb3Jt
X2RyaXZlcihkd2MzX29jdGVvbl9kcml2ZXIpOw0KPiAgDQo+ICBNT0RVTEVfQUxJQVMoInBsYXRm
b3JtOmR3YzMtb2N0ZW9uIik7DQo+IC1NT0RVTEVfQVVUSE9SKCJEYXZpZCBEYW5leSA8ZGF2aWQu
ZGFuZXlAY2F2aXVtLmNvbT4iKTsNCj4gK01PRFVMRV9BVVRIT1IoIkxhZGlzbGF2IE1pY2hsIDxs
YWRpc0BsaW51eC1taXBzLm9yZz4iKTsNCj4gIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gIE1P
RFVMRV9ERVNDUklQVElPTigiRGVzaWduV2FyZSBVU0IzIE9DVEVPTiBJSUkgR2x1ZSBMYXllciIp
Ow0KPiAtLSANCj4gMi4zOS4yDQo+IA==
