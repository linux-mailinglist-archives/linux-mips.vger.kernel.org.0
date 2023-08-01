Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6077976A54D
	for <lists+linux-mips@lfdr.de>; Tue,  1 Aug 2023 02:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjHAACE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 20:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjHAACD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 20:02:03 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242BB1726;
        Mon, 31 Jul 2023 17:02:02 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36VJpoQa031464;
        Mon, 31 Jul 2023 17:01:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=iaV2lmHmlJmQDgliWd2fUrWneRS+VqGV0zhUzg7gQss=;
 b=pBHNtwNSUxdmv6sMchkQoLrx2ZjhbdoVD5e7O3cFbcutTf9WbOOZokVHVdzhhl4Pp+7I
 wlD+5FK8gqSqgWESXy/A+zDOspDSQhCAxTLA/GlPxrchPEnCX2xE/oktOKEiTmruZfeo
 LAxgJJAqRF3hCDICWVkK15vfoiCoEzvRZ6DhyQ/f6qhoULofNdw2zCvYBE8waDs4gpOz
 Xrw9qHeB3NfU1bua8TTTClpk4shh1xebU2A/YjC0rD3UzcS+TErc8LjM7PvB/ueiozcR
 88dKh7q0glgwR0rKU6MeTt4SOT4HlcZjWClF0y+X4+QDPdu/xvwUHeIJ/zq4vWB/wdav HQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3s5213gw40-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 31 Jul 2023 17:01:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1690848110; bh=iaV2lmHmlJmQDgliWd2fUrWneRS+VqGV0zhUzg7gQss=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=W2qsgywg9dzsGomvjClIVp9VUCC8etrM5EZycTqwQuIo3KCSvf58OuTPPUIrC0hvI
         I7ujXP8X6Fz+PJF5sERqdjNsXTurFWmta0MoNGjqtBFrCXYENcpiXmWfsOWrZZrong
         9Yl/GDdJqZPuyYBf4tLX3TCXODZnuElpTLfplQoxUXSDbZWnaZCoei3EcjHKUvy+Dg
         lCgrANCPK+B5OBU2YX1shyV+/GMdcvV8zzIcPr5hm7fMSRx5AwUnuLbJ5zBpk698Bf
         wApf0D5WMQEl8rtkPA+U332+8NUqsoOy3IAk4JTiYAuE9uU7PKdcTy6gYLFZ+mWZu4
         BS0QpvuJ00Qkw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AAA4340565;
        Tue,  1 Aug 2023 00:01:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id DF70AA008A;
        Tue,  1 Aug 2023 00:01:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=B73H4VW5;
        dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1E90B40353;
        Tue,  1 Aug 2023 00:01:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8IGgsop+uzuN4EMGV0nCXDNvO/3PH2bUCmDRPZl5lcdvLptRW5/oyhMA7Tppl5FOle7xS0YdZKwRMY/HmpjEQ91pfe6f0n8QE39z6Zfgj+WYUNoQyJiQBfAZ0K85SNjI4SpGqpo1LZrQq3350G7H/ufFATf4pVCiz7PhO2ZfROmGEc+giDh5g13p7c8QDWiS6edC1ivvZSUWfErUpZpfR4a7NMLKan6Kqd4DXaoNDJvs0MHIfuuVUH4bw952c64+6hYo1D30Jc3XN2FzllpoPmQQ8gydWjbj4ACD9osAt9l12/PWsrSm4RPIWjun+EvV5rAJl16j5rGEUyQo/UYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaV2lmHmlJmQDgliWd2fUrWneRS+VqGV0zhUzg7gQss=;
 b=B3bKy4HR3JgAEY3+phCf+MXNQihbV9/LJRFiuVdrmor0uTbRbpaupxKKWnt3rnMjKHzWou0tiPZ8wx+xPm4CBBeA//SqB4q/i8SnogXVgfhEw2w4xVxDw+CPnldMaNXb2aTZ4SixippHqNLFMnt4UTXxj+Bt/eR4YCk4SgMx4kv575v04f7GM8GvPnWQIiJWf4/y9g7LnkJPuzrTAc5/XR1VS5AGzSZhb1FGU0Uwbup/pEHop2/6CPhkXT7V92VHmJjCoGapF0rPSb+ZddD9zPYpxv2M2ilXu8AVhffcBASkD7zvWcCioaU/RqFzh9HjZN7NvRWP3RZ3uDP2/U00Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaV2lmHmlJmQDgliWd2fUrWneRS+VqGV0zhUzg7gQss=;
 b=B73H4VW5NN115rYMfNOioM2ol07LWhT8NlQolFypeU+W/l40YniD6K/8BVkB8rNR7ibVB5jxltW6zmSdBJ/VDXhDtMU+/WnrSe4riSCH/vSV3HcC9YsYNSeej+Ne2envHd78ap5otdzW3wm4pw8Z68Bvp4qTQeGXGA7BjNNYN+U=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH3PR12MB7618.namprd12.prod.outlook.com (2603:10b6:610:14c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 00:01:42 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33%5]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 00:01:42 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 3/7] usb: dwc3: dwc3-octeon: Pass dwc3_octeon to setup
 functions
Thread-Topic: [PATCH v5 3/7] usb: dwc3: dwc3-octeon: Pass dwc3_octeon to setup
 functions
Thread-Index: AQHZw5HX5aTXomgJEEmUNFwyTvSMGa/Uj44A
Date:   Tue, 1 Aug 2023 00:01:42 +0000
Message-ID: <20230801000140.cgl5jo4z3tatxyna@synopsys.com>
References: <ZMd/HzISn0mPsNWt@lenoch> <ZMd/gt58laSlqAAT@lenoch>
In-Reply-To: <ZMd/gt58laSlqAAT@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH3PR12MB7618:EE_
x-ms-office365-filtering-correlation-id: 5e497f8e-fddc-4910-87ba-08db92227cf3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fPDNg+fZmPo5J/s5/SQHoWMjND6YsBESrjjH8Oot2z+WWowVi0p9jfnmZ49HCFg4mpthVkG9XhpcuDJYiJTEshkOqar0IkS8DEExiwywTEmxhmrt/7Gq5Q5/OS9J8PRLMt09CUnhi6NJvpKVsItu6qaS1G2oYmTQ3RCczJQXjOidfgj6GPQ12KUZxhmcVRU1C4rahCUBolDRu85CFzd77IKOhT3sLl/WqVPlRVC9KakNUjypK8W2Blv24xfk9Lip349/DWKbCElPsWJk8ulioDEq4fCHFQoLc5Z3olUGnSS4ohGMfe350c33fDzlODAWLlSQ0IZTAxrdQrTdZlEIygs2OkHlbQi9Jdf6zK36SuJaMfykMCE+ZjagiGUlE1TEIpGypYcgbOPq0VT865rqcVCFXKjHTFZIOSusCLcx3rs+38pu7+cjpjf/UcgiKp+CKBMxvscXDjQgRd8VG/U4T4BombbHdSQNjJ36OQGluQ6Nd3BXA46LYRvudRptb3y4cTi7TGKsmn+Y4uoWB+f176jdtxOgzdyKOMify7A/ILncgdtgsMbCe0pjWvaMP1mm+iGFrH6lJ7j42+/nTIOyWAjBG/2huOfoP4hbj3yMvfmHAzJthPOaDzplsbKJwsJw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199021)(6512007)(71200400001)(6486002)(186003)(2616005)(83380400001)(36756003)(86362001)(38070700005)(122000001)(38100700002)(26005)(1076003)(6506007)(5660300002)(41300700001)(8936002)(8676002)(76116006)(6916009)(66946007)(66556008)(2906002)(66476007)(4744005)(316002)(66446008)(4326008)(478600001)(54906003)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjZibU8vWW9NV1RVaStKS3R5OEM0czVZcms2dU5KSnlsM1lPNUt3c0ZqM2p3?=
 =?utf-8?B?TGZkVXNKK1dwUE5XMVNRTTRnb1dnWmxTd3BDY1FQRUdZTDl4eVBEaXFSaVc0?=
 =?utf-8?B?MisyS3pqS1cweHZ1MWc4akY2eTNRYXZaeDdVQ0c2ckZsUnFOVWx0QktwVzFN?=
 =?utf-8?B?U0lKcStmQXdrekgrTC9SV2dsVXBHekVRWENHMGtRMVdHL2lkSVpSa3VmQi8y?=
 =?utf-8?B?VndhM1N3UzhuVWNLRml4VFg3ZVJtWnU0dmdsNm1sMlVENnBlak9zbHJleTl3?=
 =?utf-8?B?Mm5SZzE0WmxHeCtWT053MnY4cjg1SjYyV2M2N1VjRGZ2RnI2cEFkU2RLT2tS?=
 =?utf-8?B?YXFRaWlOR3VybVp5a2Y1VmdXZ2wzTWkydVVxQytWb0JZdVBDRDgzV1p0S2lD?=
 =?utf-8?B?TlRLUDdCV0hleDlrSE9zUEdVaDA1Vnl4V29tSERWM293Wmo4dEltc0NiRHFQ?=
 =?utf-8?B?YUdSU0Jsd291NGp6V0sxT2x0SnhGaXJwaUdNelVNaCtNZytYWjFnaXJtc3ZU?=
 =?utf-8?B?Y3Z1WndiTEYxTlZUWTQ4OTREd1ZJRGRHVk5FekFLOE8yMStIR2puRGpzQmlW?=
 =?utf-8?B?Mnpyend1RkErQjlnUDlCZnJrUTdMcHJPZTAwUnpMd1MwZnl4TjUraE1zRFRS?=
 =?utf-8?B?WjJUa1EyeHEvSnA2cEVoS0RSeFZvWXl4R2RNWFdIUW94QTl5dnRsM3JwdXU2?=
 =?utf-8?B?Rnp1Wk9FOFdpNTRJMDNCdEpRTE9GOWRKQkIzNFBoMlgrUUMvL254dUhmMCtG?=
 =?utf-8?B?eFJ5bmQxS0FmYW90amtpdDQ1OUQyNVlrY2JQVXBpWFZRclJYWXIySG12ejh5?=
 =?utf-8?B?TXNWZE9mU3FqSkhLdncwS0NrVUEyTmhpUUVsT0YxNmkyWGVYWGxDeTZUdkpn?=
 =?utf-8?B?UFFpT0owUWZZYVQyODloTlowb0k5STFjZ0RrV3NhYkFjUDFaejlXVVJibm1h?=
 =?utf-8?B?SDM0ODNZdzI5dWsxdGVza0M5L0RPMlZyRHRvMWR1L204SVZsK2tKTi8vRFEy?=
 =?utf-8?B?WnE5NU1pZ1Zad1dhK3ZaUFppK0dyZEpYN21TRUVqRXo3elhDUmtiZ3VMem5Z?=
 =?utf-8?B?UnFoMWNhWWVDMG9WWHVWa1kvS0ZwenZ2MU9OR3hqZEFmek1sNHU5REdpSDlK?=
 =?utf-8?B?NmJMZFlBWFF3eGpPajhwcVpPRGZacWYzbjlXMnY5OVZOSUFLQWtJRVR1MlFa?=
 =?utf-8?B?MGYrU3ltWEhqR1MwTnIvZ3RkdlJoWU5IdkF3MHUvY0RqbndRT3I3Tmh6cWxZ?=
 =?utf-8?B?SHBIcmhBVi94cmZpZzF4VlE2OWowK24xNmFBM3dVdFBtQ2tmTzVDd0dra3BY?=
 =?utf-8?B?MkdBNVViellDb3lOeUpoQTdUZlpJVitCNkxlT040YWhLMWFPNk16dEdxaVNX?=
 =?utf-8?B?UWZGUE9YNUVTaGVPQzlFekMzRVBDNG9JcVlPay8zTmlqUmZUTXBNZWRnQTJ4?=
 =?utf-8?B?STBIak9PblBPWUtPdjJFTnl0R2sxOWh4OTBGN0ZlVXRGdHJOdVJ4WWxlSURK?=
 =?utf-8?B?MGpnbjRIQldsMTY0N3VKQ2tiVzZuVXlJRTVyUVpRTjNRRWtFMVIxSHJYUFVQ?=
 =?utf-8?B?Sk9RRUpyNnNYNmUvekdpNzBPVFRqZEM1b1Z1ellnMzZMMXhHd2QxRFJEcTFX?=
 =?utf-8?B?cFM5d29UZlNObFU3bUdxanFSZXgrZ1ZNQmdRVWdvTVRGQWpQNXA2dWRESy9W?=
 =?utf-8?B?WjhFUGJzNWcybVBBbGVCWXJqMk1zNUVzVFVDT3lEdTdUQk5LSnNGSC83YTJr?=
 =?utf-8?B?bkRFcEd2NzRTazVRQ0phdnFNdGJZdU90aXhiS1dzNTBjdFJzajRZeUdOSEds?=
 =?utf-8?B?V3Z5SXpSa0Mva3NFUERYdFZUNEtaRWE2OHZBSzNnTGtNcHY0ZGlxR1BiaXRE?=
 =?utf-8?B?SnF0WlpObU10RGFqc3NZLzRISWE2LzVRNGh2MDQ1T0dyWUMxT0FnU0p1OUtk?=
 =?utf-8?B?VThBZHR3WkZ1RDd6bHk2UTN3VHJZL3ZJWldwU05mcG1XcWg3a3ZoSW9jYmpZ?=
 =?utf-8?B?cW8xWk82Wm5aam9EbG9sSkJ6QzlYY1dFODVUNWNJVUYzRDJTdVFMM0diNkVx?=
 =?utf-8?B?UWpyYUZGT0p4NXd3RkVLOExWQnc4VjJUQW1QZyswK1FKekNCK2RmMzRBWHFL?=
 =?utf-8?Q?yQgV49ROSv3omi1e2mmRjFzg5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <465E19EBDE8DCA4789FF2A45D3E38ED5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?L1hJdk5yM055M0pxdjY3cHpTYW51Q3ZFM0pQdVRFTlhSeWNaQldpOXZsM2ZS?=
 =?utf-8?B?MlU5dnUvN2tRTDJDTzdBc05QYnVlaHFpSGdUS3M4MDUzaUlPNDl3aDdsdmt6?=
 =?utf-8?B?MlJ5Y29QUzkvTDZ3SThvUkVqa3NxcythVVF2NU5sbEZzT0kwTFQrRGdZaVJX?=
 =?utf-8?B?QVpta2JRWTZ5RXVwbmtqQ3o5elBGUHBOMWdvTUwzVDlJRDVCcnpuNE1UV0x3?=
 =?utf-8?B?bFJlMkdTTkxCd2VXYVZNbHhHNFBrZ29iUmlSSXk5L2pwOHJUR3R0a1c0bmF5?=
 =?utf-8?B?aHJNdU1PSTloNG1GQmI4ZDh6VU9Xam9aTWtqMGp2SlhmUFpCdWJWYTIvT0p1?=
 =?utf-8?B?YWZwbDh2ZnJCenhhcmdpbjRaMml1c3hJa0NhK0g0SndJbit3U1ViQXkzSTdJ?=
 =?utf-8?B?SnJZMjRiOWZNOG40c1RONmxWUUZSMVpJTDBlbGxUNVhDMHIvNEpEUzEvVWY1?=
 =?utf-8?B?RFBlb0t4blRDaHN6QWlhRE1aQ2ZTankvQ2J1bjFHRU1nekZFMmhYQ0NFWUox?=
 =?utf-8?B?L3JKUnphd01FZ0FWdmRERmFaQ0E0M2VHWCtIY1RvT3ZWeFc3MklIVVVuUnRq?=
 =?utf-8?B?cmhRZ0pWOVlXQmRBTzdqcDJmMzRTaFJheERzbW5CemFqRlIvR3d2R2tMdndo?=
 =?utf-8?B?aVdqSzhUdXBJby9RbUYzQ0hxb2tldy9QZDBla2VlVWk3SDZ3ZEp0MGtvVnJv?=
 =?utf-8?B?TG5tY2Jvd3RVclZpWmtIdURONnR1VmEzQUwxMFhxUDRCU21ITHB0OHBLS3pM?=
 =?utf-8?B?V09tVmFWUkF1cWUxU0V4R1R1NGVwVDdFUC80QlFFWXdrUkE4Qi92cG9oWVJB?=
 =?utf-8?B?UmkrcEE4TlV3MjkvNklUZUUxeU1LWDZTSHg5bCt3aWwwaG5DNFUrM2VZNXI5?=
 =?utf-8?B?YU1udW13TG5ydHp5VjVsdWNQcS9IOC9VcURScXN5dGpEU01JeTlncE1jWlpB?=
 =?utf-8?B?bG9wV1F4WXdNVW1LVk5hNHkyQkwrV0NCZnBCNkNsQWJwY0dVckVKTHRXa0J4?=
 =?utf-8?B?a1VjQVI1YVNQdkg3VnJDUnZCMGNXRjY2RFYxUGtxQ2NaZ1loazFPRjcvOENp?=
 =?utf-8?B?L0o4bTNSRmt3ajltTEtUL251OUR6c1hqZjltUjYzbFdWNDhlOE85UGtyNU51?=
 =?utf-8?B?ellvbUpESkhhSm8wTkRGQm5WaVoyKzRCRU40WXdqTVhWdnB4STFIZThqR01t?=
 =?utf-8?B?RWNqNHlKMmxhNVFHZkswNnpTaGZmeFFnSnhmdjZuT0U5cmFNdmFKWWordXF6?=
 =?utf-8?Q?CMqBuGGv1h2B6Sf?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e497f8e-fddc-4910-87ba-08db92227cf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 00:01:42.5380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQ+PuJPE0sZHyDbZe2iQwFUQHy11BdaNqSIISWsrakz/1a5HaZiwTblbXurdJWum/OPGHFPYuCW4Wegu2t7CNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7618
X-Proofpoint-GUID: sVkiv1hGms-SQhVA8XWvzv4F08uV53KN
X-Proofpoint-ORIG-GUID: sVkiv1hGms-SQhVA8XWvzv4F08uV53KN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_16,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=699 adultscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307310217
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gTW9uLCBKdWwgMzEsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBGcm9tOiBMYWRp
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBQYXNzIGR3YzNfb2N0ZW9u
IGluc3RlYWQgb2YganVzdCB0aGUgYmFzZS4gSXQgZml0cyB3aXRoIHRoZQ0KPiBmdW5jdGlvbiBu
YW1lcyBhbmQgaXQgcmVxdWlyZXMgbGVzcyBjaGFuZ2UgaW4gdGhlIGZ1dHVyZSBpZg0KPiBhY2Nl
c3MgdG8gZHdjM19vY3Rlb24gaXMgbmVlZGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGFkaXNs
YXYgTWljaGwgPGxhZGlzQGxpbnV4LW1pcHMub3JnPg0KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gIENIQU5HRVM6DQo+
ICAtIHY0OiBuZXcgcGF0Y2gNCj4gIC0gdjU6IFBoaWxpcHBlJ3MgcmV2aWV3IHRhZw0KPiANCj4g
IGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYyB8IDIzICsrKysrKysrKysrKy0tLS0tLS0t
LS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jIGIvZHJp
dmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jDQo+IGluZGV4IDY5ZmU1MGNmYTcxOS4uMjRlNzU4
ODFiNWNmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jDQo+IEBAIC0zMDAsMTIgKzMwMCwx
MyBAQCBzdGF0aWMgaW50IGR3YzNfb2N0ZW9uX2NvbmZpZ19wb3dlcihzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHZvaWQgX19pb21lbSAqYmFzZSkNCg0KTWF5IGFzIHdlbGwgZG8gaXQgZm9yIGR3YzNfb2N0
ZW9uX2NvbmZpZ19wb3dlcigpIHRvbz8NCg0KQlIsDQpUaGluaA0K
