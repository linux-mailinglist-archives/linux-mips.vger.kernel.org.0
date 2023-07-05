Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEFA9749125
	for <lists+linux-mips@lfdr.de>; Thu,  6 Jul 2023 00:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbjGEW4E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Jul 2023 18:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjGEW4D (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Jul 2023 18:56:03 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF4D1982;
        Wed,  5 Jul 2023 15:56:00 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365HbcmX027978;
        Wed, 5 Jul 2023 15:55:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=eCu9Gh02wn9JX/mg0kiklYoO/WGwa0zYdEyZcdQKbIs=;
 b=twZkkjXdCi0oZl+4QUqAU8y3QdCBTPvN5HaLxrEc6drVAafuIfTP6HIOh4b8AVpvwMSd
 TMGVbz7ERdZ8Ody3kQlpPh+aaCA5gv5aSvhe07slIoCe4Wl9gHl1E3rNVBw9AQCCZrFw
 QEkYR+ROGBeG6CaJQ9rYt999pT868oOZ7QAnNTAL/dJ5v+kkJx+X5SdC9F52JfvUvhsg
 YAxugUWECZho2ge9v01iq9TM+M9PCwNeASZEt5V3aiI4lLLQ18HeIkSaQSRbdAM0fSCe
 EGxqqBDZuj0bs5BtIS9JPrfOzr1lcDK4wQBCgw6/KymkBzKrfZR96EOi4llXt1msuYys /Q== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3rjjsdt8kp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Jul 2023 15:55:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1688597758; bh=eCu9Gh02wn9JX/mg0kiklYoO/WGwa0zYdEyZcdQKbIs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=M6SBrRj5KvRBwRv8fQp2EOrIy6q1EV9HCrPiH40HF56Sk/vvQjiYfa/7FQKlBLq6t
         JfswSWnnmr4t0nhhsYatK6+64kb4eseaixhXmq4oKIe9nk4fjvRSX4AsVUJydqE7ep
         XniixJznCaRqSFYfAZe0RMYqrWxWIqEBoD72eoXGrJapv20jue4spsOVNYbQXKixij
         iCSYWo5tCfCwq1EtxScpIgDTD5KQS4UVpwe2ihAPGQ0JwBC/gKRHGiqoU/84eVKQdd
         E6P0O2+edJgozLPVkhufvuV3PmdIZOrB9FQR8KYtyhX1PHDUTfuKK+1UUij5MEjIsA
         x2DB7wJsp8N0A==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8DF0F401D0;
        Wed,  5 Jul 2023 22:55:58 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5F709A0080;
        Wed,  5 Jul 2023 22:55:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MGRAlb8u;
        dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 53EFE404D1;
        Wed,  5 Jul 2023 22:55:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ho4tmhxMzgHowaL6moro1dHkvR+m5TSIMc6TybJM+YOnl6tzrvf7P74hfOe/wEz3kbY3hTxVXmXJYVY8uFH/K/FmKnp4dQdaTp+DBD8hSGFFVW992YW226MYS3J5ti165hDsphRlMNYJihY/KlES4lYZpMC5zdJsENFnlTPZLzBej3HU5bSFkaZLYag6WGV9P6G3vFgTAVgwGVldTZuJxrO/983gfXil91Ck+e2W+bhoyAfULmrgSRGCv2wQKs8gXD2wiIljxcCU3pLIV62pJ66A0lllDssxwiNFNqebyZIrmUc0xw6PeFyxtMBSMYGxPS9oXYn4h2Ij26j6jgAkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCu9Gh02wn9JX/mg0kiklYoO/WGwa0zYdEyZcdQKbIs=;
 b=kRdJ5114QaHeAAku6aIPpSeWIk4pMrMNjIziWlDPPBaxSekvgKBn/V1IznnENn6neFAsnAJSIOfeKJMRh/w4shPqgpVdOZQab86OM+yolPJaMbu0hH6nB3E8Gif6KxNuNZN2Liyxwsiv/6hHErJS1n/sui7NozKYwTK2SThgn/sFDgWesRmAjspb6pW4N7a5rJrGBE96LaO7PpeSpUhr3dXZ427e2HsUKysq+9ayhKaPeL3KFZ534KziBHW8jSSIzugpyQ4XLMI1fYrlyL2B6WedhRwB3aZQ5ZzIEBMPdsZToTDKSsJOCyiUGqIqONe7dEwELONOZoUATh4ntTl5ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCu9Gh02wn9JX/mg0kiklYoO/WGwa0zYdEyZcdQKbIs=;
 b=MGRAlb8ubYBKBJiYeLUHdMj772qN3fUkdFRwIZksrCNyoRGmrnap8yrpaVZO6wsqaNIHtySf8MzcAca1lOkxtmD7vp9xqiSyPUdyCpcItwR6VVOmnx3rJ//nm66Kw+KPB6puifbXgLL3x7w8uncV6YmS0HWGRzxQwcTDzgzgWRo=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MN0PR12MB6004.namprd12.prod.outlook.com (2603:10b6:208:380::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 22:55:47 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b%3]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 22:55:46 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 10/11] usb: dwc3: dwc3-octeon: Move node parsing into
 driver probe
Thread-Topic: [PATCH 10/11] usb: dwc3: dwc3-octeon: Move node parsing into
 driver probe
Thread-Index: AQHZourfmmGdZN05YkqqS/Vo8kRsxq+kDw6AgAGfQwCABjN+gA==
Date:   Wed, 5 Jul 2023 22:55:45 +0000
Message-ID: <20230705225541.753376fitmwnugkg@synopsys.com>
References: <ZJC165p0Mj4jHcBh@lenoch> <ZJC3eK8QMxShyZDt@lenoch>
 <20230630232733.rvibxvrcqkkj7dpw@synopsys.com> <ZKDBPijPY5hbv9E4@lenoch>
In-Reply-To: <ZKDBPijPY5hbv9E4@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MN0PR12MB6004:EE_
x-ms-office365-filtering-correlation-id: 78a713b5-f240-47fb-3613-08db7daaf7e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pxttOr/DRpMId9uwkYKUvtrslfbKzuF2VelcDy5KuBhHK9VLkDcqVhmzqWUSRObRUOO5KgIjMdPC8NMgqkh+ghoZOf/OE+fIfJRzCWsKLvqP4f8FKXEvDv7zYiGo0WZLbyKM5L26XVQSwfe1F3SsDTDDB4I8xDj17ymbE15OlCvZitkWlqCQF0laekc8sPL/DNRWyRFgbCMbkPXEEOVGYI9M0ijeesDLaEZaYftse2K6z7TYHTME7AFY4qLh7084c6pnjPyXWMlEPaj09tn+HL0m7fM+IO2TzabluTDUydXM7JnukN6uu7x5GrbhcTOQEjtHfNTEsrULUHzeJzAj2px4dlyH6614Wx0526k8FfUS2Cs/8g//V2bSCG3mHBWyyZWqknkT7Yg/HU2jdidxwaBBJ6m7YwQRys0L8WoHS8ib8sWNxcsGZSmpJW8T0BWHamY+CnAyIvtJjc6PF95Z3Lp2dd/jk5Kp10LXbn60Ri3/ZdWRpmyV3YDizpFyNnJcTJ2PfpKUuzalNE8hUzm4U/wTaAKrKOPjnNneN0Mg+HQsbaWLNKV4NwS/63h5jY5a4PyRWRzUPy1nouoZv07eWEMyTiI41lMzicu5iAc0SK3ysD/qMjgdUiqaZJf/0dWB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199021)(66446008)(64756008)(66476007)(66556008)(6916009)(54906003)(8676002)(41300700001)(76116006)(4326008)(91956017)(8936002)(66946007)(316002)(122000001)(38100700002)(38070700005)(1076003)(6506007)(186003)(478600001)(5660300002)(6512007)(26005)(6486002)(71200400001)(86362001)(83380400001)(2906002)(36756003)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0NMdVQ2L0ZTSGtTdVZ6bS9IU2cyaHNibG1yU3FhV2lJSFBVQUV0UStnUWt2?=
 =?utf-8?B?d0p2eFZkZWNiWWs3Rms3cm4zOG5MNFlOa0ttNzF0TVlpYzh2clEvTnlzYTI0?=
 =?utf-8?B?Vjcydm9aN1o0UnRPQXpKdTYySVF3SkVQVS8yQW1yem9IL0wwMnNXTGtpMEdV?=
 =?utf-8?B?Y0dpQmF0eEgzMnhUSXFseHhwaVFZRit3TnFPdGUrT0o0N0ZmVmNGdzdsTzVK?=
 =?utf-8?B?Zm4vbU9pWitKU1pldlJpUitjQURXMnUzUDVqdzlBZDI5Z01XVGIvMi92SVJD?=
 =?utf-8?B?clBRR0dZY0cwWVRZaEpvSGdRc0h6dFFhVlkwa3ptUE0zWTFRRFBycDN2UFBO?=
 =?utf-8?B?RTk2MU9lcjc5UWVwVUNxRmprL0krOEk5Z1J4VHVLeWZ4THZhc1BGRE9qWU1E?=
 =?utf-8?B?dVFWUUxPUFFtb3NYVlFaV2s5QXpUbjVQaVh4bnBSVXZJVm1mbHorZGdjR05X?=
 =?utf-8?B?VC9YWENkT3lmdVI4bk5qZEJNTEFSL2NuL0QxVlMvT0tyN0tMTmNzdjRWdXVX?=
 =?utf-8?B?TkpndmRlenFWbVFwNmdjcVRMa3NXZlNvNVBvQWJRSFpGanNyMC9Ua3hYVllT?=
 =?utf-8?B?VlBlL3dnR1lQSkNnRjllNjlZK3pKMGZpR2RWMElTWC9QUnQxTzdYb3Awa3lR?=
 =?utf-8?B?T0QzNDcyYWhiTFN0K1MrSHlaNjhvRDRlU1RBd3MxVTBoSktYeUFhVVpiNlN1?=
 =?utf-8?B?UENKNUlDMzhtSWZYWUZNSkJGQmxGR1JsbGFURmYyYWtJSW10dkRqYXE5NkFl?=
 =?utf-8?B?WE0zVGhFZEFSUWxmaDFZU1o3Qnl1K0ZIUVMyN2E5VEZPaEU5ejVnNFlLb0dv?=
 =?utf-8?B?ZVIwajNsQU9OYWhwZXpoVDlwcGUrQ3FSQ0RBTXlkTnM2UEJhdHIyTTZTM0pw?=
 =?utf-8?B?SFk1cG5jNVRGNzhsWldoYzMybEdWQVh6amU1ZHlLT1oyU3RPcDgxcThhZzRF?=
 =?utf-8?B?MWlTL0pYNW1pK1k5QmVoaWtEbTNYMUNySnlmK3gybjZWbTBybGw0UXZ1Sy8v?=
 =?utf-8?B?b0dCVG12UG1hUmZiTGR5bDRrN1VoUXYvcy9scHkreUdESWRBbnhLbjJqNnB2?=
 =?utf-8?B?WjNpMlYvamJ3QlFybEtFOXo0cTQzamoyOUd2VHV1MmFKYXo0MlZubzhtOGM4?=
 =?utf-8?B?RVNBaGg5cnpmeVRMM1BHQnNIWU1RUkZOQlk3NWN0QlN2dDN2SGh4N0RkNmkx?=
 =?utf-8?B?RDU4RjVPK2Q0bUVRcWRkeTVaajFSdkhSMXNnTUk4NVM5UHVYbUR0S2ZCN3Jw?=
 =?utf-8?B?bnBIS0VEb1Y5bTNHQ1JkYWRJNVFYTnhGbmRWRGNmVEtBckQ1eXFxQ3lDSzZh?=
 =?utf-8?B?cEFJamlIbTlheWtjam44WHFuSFhaaVJpcGplcUFoU0o4ekE2dkN1RGR4TnpF?=
 =?utf-8?B?Tzk4cEZjVkZSU2pCMTNUMW5GdzF4Y1ZrS0wxbE53MW1rT1REV2t1OSs3bU4v?=
 =?utf-8?B?enFaYmlmTWZXTUpwUnYrWjEvaGJvSFNaRUJxODlVZ05talZqYkxGZ1BEMTlU?=
 =?utf-8?B?S3FaZnlhOUkrWGo3YVpXazBHcVVBZE4vMHRsN29TbjVzOEVYWTJLQjVDd2ZB?=
 =?utf-8?B?UXJ4Vjdmc3dacGZJM2xlTzNLNFJUSjBMWVRJWExsdlR0cmNwT01qN2NNeFF4?=
 =?utf-8?B?Tm9ZNndRNTU1aWdSMHhyVzluUTlsZlA3S3FOL3E5Tldpeng5a2RFVit4SjJF?=
 =?utf-8?B?M3M5M1lFdXJYWmZjZUFJandLcEFVRXdXbUZCT3NZZ05wZ0pkZ1JpQ3M0QUZB?=
 =?utf-8?B?UUJmencrOUxwSUlZRENaT29KQVAwcGYyYXhDYUxoTkpCaUxlajR0bS9CNmxj?=
 =?utf-8?B?d0pVWk5GU0RxclVhOTdXQW9DemYveEhleWZZYWkxemlGZ3g5OXNpZEYvRDVn?=
 =?utf-8?B?amlFbVh4eVRzQ29TSnE4ODErK2REblhncjVKR0RtUXNZTEgvRmxKKzI1WCt4?=
 =?utf-8?B?SURuY1R2Y2pNUHhZZHFwWnRVTS80cC9pNDlpdEgzRno5UkxReFh2R01IWHpR?=
 =?utf-8?B?cVM3WXd1WmdvTHFFN3FJWGtPOFJ0ejUrb3QzOHhVRG5scUgwV2diVDZOZG1J?=
 =?utf-8?B?aXNkaDR1eVZ6SlJrSDl5SU53WHhGcEd4T3grTTNmV04xblJuWnFLbXVYQmpu?=
 =?utf-8?Q?CKYfNXvx2JXgD9//qD09h9eNP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F58A2DF20E01241A88A99AE41C60347@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 8badegLWkHkRR70fjQB3sD6xI3MJEdAntOUKeuepn0SdoC8EcefbE7M08OG3cINu1AdJiU2hTpgTF22XAwmbbLVrwmCFukuHZSF39c+kooywSmPy4RI5Kxnm6+weWQfC8VWm4nQOZIBLJ3KS4mbtOHE6hV1yBj+VBeovalJpKBuo17OJlUCzNo13C0PcW+Nw+DQY3dpN0yOrAwFnKotD8pKjuGUEJQzusQZxXEpayxAWa7sfvwzWRBlYbQjg176dI1tgw5mt9mpfFV7nkY9/8kR+oKKQnDpFGqk7Y8bNGSWHKMshM4ExjXRGqTYchKFYL0NgUTeaOUKsPh5gwqvFZDI8O5clN/KY4uK2GRLMpIhuz8/YqT/etWfA/ITGCOONNEjhMo9b6uE7v08hIrG3UUYz3WzXbgiIlumsxBywyvCPph+lAkd3DIgxH3uM/pBKFgL3Oh3cHSBfHeZZMCJ8IGm6wEpXE6vD6RpdZQFHIvFATS25tfqlhKfPu61w3HVx4SHng0WUPLVfT+wYoTu9pq2NLy+0j21+KH2tnZX5UnD4jtDMPPBU+8c6jyA0x0sm8xnn5wyZuUHldk13yZGDo8dvjcG3G5J3XBwWWbRfVE7HvwQrwntKK7FI8V98+oMptEu4LlvOo80iGa5LnZIf6HFXT3pogvgr7cXX4qqZ+MXZK0B8DUDjI0BEacfiFiMuwFrhPHWq/l0AF9Zcg4QKzn9qEZdoW9f9nOPt9MG2P5a0n90n7GSIrreayjw1tslUEw9F5K8X3RmEdhAYnRlVOGN3pMdTNloqNWIy7waUMEiBOuoClJqCFetUwxC9/uj30xupNj1D7IBnxhVYEZWYXA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a713b5-f240-47fb-3613-08db7daaf7e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 22:55:45.9148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TIvb87s5LF3kKr1TD0HhzA4evlLL9LSFsewRsTVhAwH9s+RnL2j7k3Hd9T1TQeXpG+h/oKrtJ/SaeKqX4zeUYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6004
X-Proofpoint-ORIG-GUID: 6K4SVds6dcEcO-aIy68asi2rWlJEvS9u
X-Proofpoint-GUID: 6K4SVds6dcEcO-aIy68asi2rWlJEvS9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_11,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=928 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0
 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2307050207
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gU3VuLCBKdWwgMDIsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBIaSwNCj4gDQo+
IHRoYW5rIHlvdSBmb3IgcmV2aWV3LCB2MiBpcyBhYm91dCB0byBiZSBzZW50LCBoZXJlIGp1c3Qg
bGV0DQo+IG1lIGFud2VyIGlzc3VlIEkgZGlkbid0IGFkZHJlc3MgdGhlcmUuDQo+IA0KPiBPbiBG
cmksIEp1biAzMCwgMjAyMyBhdCAxMToyNzozN1BNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6
DQo+ID4gT24gTW9uLCBKdW4gMTksIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBbc25p
cF0NCj4gPiA+ICsJcmVmX2Nsa19zZWwgPSAyOw0KPiA+IA0KPiA+IENhbiB3ZSB1c2UgbWFjcm8g
aW5zdGVhZCBvZiBtYWdpYyBudW1iZXJzPw0KPiANCj4gVGhpcyBpcyBhIGJpdCBwcm9ibGVtYXRp
YywgY29tbWVudCBhYm92ZSBVU0JEUkRfVUNUTF9DVExfUkVGX0NMS19TRUwNCj4gc2F5czoNCj4g
LyogUmVmZXJlbmNlIGNsb2NrIHNlbGVjdCBmb3IgU3VwZXJTcGVlZCBhbmQgSGlnaFNwZWVkIFBM
THM6DQo+ICAqICAgICAgMHgwID0gQm90aCBQTExzIHVzZSBETE1DX1JFRl9DTEswIGZvciByZWZl
cmVuY2UgY2xvY2sNCj4gICogICAgICAweDEgPSBCb3RoIFBMTHMgdXNlIERMTUNfUkVGX0NMSzEg
Zm9yIHJlZmVyZW5jZSBjbG9jaw0KPiAgKiAgICAgIDB4MiA9IFN1cGVyU3BlZWQgUExMIHVzZXMg
RExNQ19SRUZfQ0xLMCBmb3IgcmVmZXJlbmNlIGNsb2NrICYNCj4gICogICAgICAgICAgICBIaWdo
U3BlZWQgUExMIHVzZXMgUExMX1JFRl9DTEsgZm9yIHJlZmVyZW5jZSBjbGNrDQo+ICAqICAgICAg
MHgzID0gU3VwZXJTcGVlZCBQTEwgdXNlcyBETE1DX1JFRl9DTEsxIGZvciByZWZlcmVuY2UgY2xv
Y2sgJg0KPiAgKiAgICAgICAgICAgIEhpZ2hTcGVlZCBQTEwgdXNlcyBQTExfUkVGX0NMSyBmb3Ig
cmVmZXJlbmNlIGNsY2sNCj4gICovDQo+IFNvIEkgcmVhbGx5IGNhbm5vdCBpbWFnaW5lIHNhbmUg
bmFtZS4gQWxzbyBwbGVhc2Ugbm90ZSwgdGhhdCBmaWVsZA0KPiBhbmQgcmVnaXN0ZXIgbmFtZXMg
d2VyZSBjcmVhdGVkIHRvIG1hdGNoIGRvY3VtZW50YXRpb24uIFZhbHVlcywNCj4gaG93ZXZlciwg
aGF2ZSBubyBkZWZpbmVkIG5hbWVzLCBzbyBJIHdvdWxkIG5lZWQgdG8gaW52ZW50IHRoZW0uDQo+
IFRoYXQgaXMgc29tZXRoaW5nIEknZCBsaWtlIHRvIGF2b2lkIGFzIGl0IG1pZ2h0IGJlIGNvbmZ1
c2luZy4NCj4gDQo+IEFuZCBsYXN0LCBidXQgdG8gbGVhc3Q6IE9jdGVvbiB3b3VsZCBkZXNlcnZl
IHByb3BlciBjbG9jayBhcGkNCj4gKGNsayBkcml2ZXIgdG8gYmUgaW1wbGVtZW50ZWQpLiBTbyBo
b3BlZnVsbHkgdGhhdCBjb2RlIGdldA0KPiByZXBsYWNlZCB3aXRoIG1vcmUgc2FuZSBvbmUuIEZv
ciBub3csIEkganVzdCBrZXB0IGNvbXBhdGliaWxpdHkNCj4gd2l0aCBjdXJyZW50IERULg0KPiAN
Cj4gVGhhbmtzLA0KPiAJbGFkaXMNCg0KU3VyZS4gVGhhdCdzIHJlYXNvbmFibGUuDQoNClRoYW5r
cywNClRoaW5o
