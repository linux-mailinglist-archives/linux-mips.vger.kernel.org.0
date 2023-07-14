Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22E30752E54
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jul 2023 02:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234456AbjGNAiU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Jul 2023 20:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233676AbjGNAiT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Jul 2023 20:38:19 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C04B2D5F;
        Thu, 13 Jul 2023 17:38:16 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36DLEDX0010328;
        Thu, 13 Jul 2023 17:38:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=/aNFnF0JM/nzyeksvP4nOFRZ8nqvHObBOKex7YmQ2hU=;
 b=MoRpsOuqkvB4/oJGuz0tXso6o/fQM1zJgBNetSD9W3TneR7+NzlODfptUic9EdM2Zl8r
 s3PGGtjhyUojSC2zqE7Dw1bzVsuXzsVzXx54ly4ZWFMfcvb9YtGYS2K7yLl9tfbgPloh
 B6Eu5ui6Q/RM2Eu7JkZ/7k/EHJGdtaIrrMqJTRMQHN5T/qg6hSMhHiz94b26bUOX3KGf
 l+wtfiFCB01EthIjgOesANnrvvAfupdDVFB9djT4lr6gVvjJMKYBYlBkCg6YzallAy8f
 GxAFM5RiWNwWzc2zQFhJPD8R3j2yq/ZSMqI/Z+WgdyWFj1ndvEwldPLVwMAD26AMNAEF zg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3rtqq88yy0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jul 2023 17:38:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1689295082; bh=/aNFnF0JM/nzyeksvP4nOFRZ8nqvHObBOKex7YmQ2hU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=OihvuorTjkO10Kljq7ey7htojQjzv2IlvTkrAjZ5mjWWsABczRMb5bYtARbIzCfN9
         3gDXdJjJJpeOBaX/OUS4Q+BXr0tRJwmPPkihLnxnkfVlI+FZAkYPOAhgFY/xMXxx4L
         mu5KvGkF10D5N4BdC9mAAPfwfcvU9eeA1HxOiMcQkTTV7z1X3Rak9SSIYdkZ/zGBU5
         s2DwlBnPnkg6LOyujOReG1FNWCKd5N0A1AWuGyeU2moa5b0qLGBwdpT5Qwqz3txAxe
         xme0a2SsnfmZQIGSPsopH/6MR5PhyhWFMtqkRBZAXeDzWCT9Ytp7Gj7zM8Hu/via1+
         +CE00XMBXpT6g==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AB3F4404B0;
        Fri, 14 Jul 2023 00:38:00 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 8652FA005E;
        Fri, 14 Jul 2023 00:37:58 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ctZfFo3P;
        dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4E32840359;
        Fri, 14 Jul 2023 00:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMemadTKTLbB5y0ptlM4WVuobcJAFuamv1pWmNJBFC+jWcIg2lu8NEGpcJoShJeopcODlzVp7Ee40TPF9O9HDTWyFNwyHKEtg8KsFnyqbKJtv1cTZmcefmWH3dHsx845pwD5i8mc9DI2pf+IOdzHGP6TC6S/ZHoubxFhW1sMNWrtIcCQNcOC78rM1MtABFinNzFock6zGTqmlS72bJi0vt2h4zhT+7Qd04FYh8Hc53V/D2J8EOd2Cx2wsxPBqR/n118WSNyNzQt9/WxXqryTLoqgHEatKb6PtkWFwfGqIhRFAVLgInK6VNBXRgVy5ZntyuJUs5DtPNAXRhWfCTAIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aNFnF0JM/nzyeksvP4nOFRZ8nqvHObBOKex7YmQ2hU=;
 b=WATiMti44hfk3uiym1LWxX9DGYlObo6ewwuc6a3FaS4NTCxDUHeofxwAq5aghFf5uq4iZpC2bi/gEmywez+LKAPNHRG56AoNNswjzHxbRAPYRHtutjR7Q6O8YgiFLaHQtrbwQ2ZVvuRvTvfcP5XcCZCLS+i5DqIWbfcxhaPcarCFkr+oxa0+DIFT5GImDDEW89hM5wvb7391tfDPIymaFqoqJyupgN6Ls5Wj4OFKWz5C5oKFgVqbJBf1O2kPU0ytKK+Xcdew6skZGL+wvI5n8GhoO+bzaaYe2qrR9AO2gMX4nPNbGpp7J9qPzF32z2ZREJYWxHwo+TvgPFIEggsKvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aNFnF0JM/nzyeksvP4nOFRZ8nqvHObBOKex7YmQ2hU=;
 b=ctZfFo3PuhuirAKmEO28g8xvMrBD4UGHhi+F7O856soASaey50ln4l9AfV6fj3Bh7TeJ5bUv68YP0ltoBKD5p+uMvLmTRKr2Szf2GJrLjaKXi25pq4REdYIhZ07Q3a102QwzxjmCriHkf/WtUyO1V/ppv7zpMWad9Obhtf5EM6Y=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BN9PR12MB5356.namprd12.prod.outlook.com (2603:10b6:408:105::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Fri, 14 Jul
 2023 00:37:53 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::adba:1075:fd90:fe1d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::adba:1075:fd90:fe1d%3]) with mapi id 15.20.6588.024; Fri, 14 Jul 2023
 00:37:53 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] usb: dwc3: dwc3-octeon: Convert to glue driver
Thread-Topic: [PATCH v2 1/3] usb: dwc3: dwc3-octeon: Convert to glue driver
Thread-Index: AQHZrHptXm+dTI9vnEWniTbWzB+Uha+r1xGAgAxzKwCAADOgAA==
Date:   Fri, 14 Jul 2023 00:37:53 +0000
Message-ID: <20230714003746.eng3xiyl2qm44pdi@synopsys.com>
References: <ZKDBiY6TKdDKIFK+@lenoch> <ZKDBxnAulDCQCgVX@lenoch>
 <20230705232541.wsutfrdx5ltp4rw3@synopsys.com> <ZLBtjPQp9LzE0Ger@lenoch>
In-Reply-To: <ZLBtjPQp9LzE0Ger@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BN9PR12MB5356:EE_
x-ms-office365-filtering-correlation-id: cef6d268-dcca-4cf5-d5b8-08db84028f50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 65i68kbUr6eUjZNOvXUF1Z/Eshbs0uUGT9N5dY6+zeIyolCOXbvsi7HbeGMMSj7cluEp9NkOSkngbaoRRTG0l4CL258zHtNaymgpxao/2hTD4qgUCK9Jv15QhNJxwPY/P9DZ8LuxggOrv1pajQmrf2A/JZE/gh06YWtgGZrj5rvJp3sqGRCOrPuBCphTcMOSCTfxP3SZ/nM90+Hc5u2SZpZKzun01OvzNPmDv/x5shTSaGsmtbL8YB9dQUAoxaX/Feb9Aao3vq+SDqYmlNQhWvwWpBcNkigmccy1TyI26gT137MZTwqqO+rY32PrtH3cWDVEJ86yxG0zOfaJ5Laq1L8VrxQrlCdPg5gggZddHxp2148cxkny0WmiuhF7GuPO3iUu2RD6h+qBlW+w/HXE4uoqUD9qxh0VucswDhg0837vd0G1F+O+1g15sI+BCsu4UJcvLTDnzFhwU3D/ml5FxnqpYPdnsKa5pV+qzhx2r989bVjZaN5E7iINMcj/3JHEMdphHCmsu0Vdc4sQGVXAjwhUBuKN464Zh6Sw6CkNXgVVuo6o+x9HU4An+5aJaDoRHlBgbK8758iPHmB584wHAiHMwdUZRMpNUBl1oHrv6hvecM+5RnbVTvVabKmsTQFy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(36756003)(316002)(2616005)(478600001)(86362001)(41300700001)(8936002)(83380400001)(8676002)(5660300002)(76116006)(66446008)(66556008)(66946007)(66476007)(64756008)(4326008)(6916009)(54906003)(6512007)(186003)(122000001)(38070700005)(38100700002)(6486002)(6506007)(1076003)(26005)(71200400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFhjZEJIa0tCSFk0cWNXY2ZxeWplWStvdnRuZEFCUHBtRlFxOFE0KzdGV0p4?=
 =?utf-8?B?aUYwRlhDcW0yakdoMU83YzBXbkhYWmNERm9VeVcxOExER202ajlmalI2Sy9X?=
 =?utf-8?B?cE9OZGhpZlNjYjJqakRwVWdrVzkrRkNNdmY4d2prbUVxb3dkZGs2ZnJFUjVs?=
 =?utf-8?B?K3BIY0RFbVdqaGtBSExHR2w4N2Q1a0tXanRJcWZtOFUxUWZvelo1OEJwVjBN?=
 =?utf-8?B?QjlQOHEwcndjVXNleW90cGMxTUpnbWc3WlNHbHo5YzZSTTFxa3FQallubUhU?=
 =?utf-8?B?bzZZRFVkU0Q1NExtRHBKV0dtZjFyTG9lN1RwV09MTGJTQUtzWEJLSlBDcmYw?=
 =?utf-8?B?UEJiMGk3Y1dTRzVaZzhtb2NrOXhrUTRrZlgzZUZlZmx5SjRmdnVRUXlMZWY2?=
 =?utf-8?B?ZWlRWnppd3JVWWt6SG9tVWtzbUtrWUhPY0VJWjNCdGlKenJ5NHNZMkd4ZVl1?=
 =?utf-8?B?d254NlBzUS9HOWN6SGZtZFVScDJtNDZRdU1QVHhLbys5ZzVBL2cwYXl3ZlNL?=
 =?utf-8?B?WUpVSG9SeWJWRnY0bzduNnZkS29WWDcrNXhSbWVHUzV3VmxncEJFVlJ1bFdr?=
 =?utf-8?B?RmcrSlpPLzJHV1hTMkJUNWF3d3VhemdESitRbmdybDl0TXlTRHA5VzQ1Ni8z?=
 =?utf-8?B?dDJNZURrYjVFekl2c1NMMmpHaTJYNkVVaFIvajlhRkFmRmRkbUFtMlJqcWxm?=
 =?utf-8?B?OXI2QkQ3ekpIcnBiNGdZUUFMUTNzZDA2WGQ4SjJidGk5TTVHeGh3R01VWFpM?=
 =?utf-8?B?RG5WdFNtMWNibTZFeFc5SjZuT1FSYWhsai9IMDlHY3lGUnVTOVNCV1NleXFP?=
 =?utf-8?B?MTkramR2SENQTnJzaUJiaGJlUlNyem0zanZ1WStETFgyMDQ3VWZnRkZnd3FS?=
 =?utf-8?B?RG05OVAwL1E3eDhFbEZxWllGckZXaDNxZjZJSU84NDI5cmwyNGQyWmhtSGVZ?=
 =?utf-8?B?aFBEUUtEa2U4dXBiNTFNZGhXYjlUWll0OEZLcFdieFAvT3lmdmRYWm1FcHV2?=
 =?utf-8?B?U1N6U1I2V3hmM2pldzEvRy9hUXRNTk91c2h2dXFueERneEJOUzUzelFqUWls?=
 =?utf-8?B?L2QzbUlENWQ5dGpoSFRkdFVuNEtaSHhtcU5zQ256cWNjK240UkVlVEJVUGtx?=
 =?utf-8?B?ZmM5Y1VNdCtIODZ0NmVySXBlcjcxb2ZEMnVLQXIxcm9DRkszem1LemkxZDFt?=
 =?utf-8?B?NWR5RUNhWEN6a3d0dENEZUNadzZXRU1hMmVJYjJDd25QeDhTUnlCcFVReXVG?=
 =?utf-8?B?RkJrTUs1Y3BlZzUyblZZaUVPcnY4YjUwYng5R2ZYRDhuRS8wM1VTRVR5WFE4?=
 =?utf-8?B?cXEwVUN4UldqWXVEU25sL3BrVWJsQlBhaml3T0J0ZEpYZ1RUZUFjWjFoVWJi?=
 =?utf-8?B?dWcva285ZFJQUi82TkdWNWU0VmY3RkNiYnJaMkl1UE9scGF4bTNLUmRjK2lG?=
 =?utf-8?B?Y0JiMUpKaEl3eEJiaTl0UkZncWJCQms3K3hrb0RwcnJIazlGTXdsMlFkRE1H?=
 =?utf-8?B?cmFUZHU5a2ltcmhyUzVZeWZxclhIa3pFZ0txOGMzWFk5MDEyTHluZEREQ3FQ?=
 =?utf-8?B?ZUQ5bDYrbElyT2UvYmVaRm1hR2ZMMnM3MkJmK3JUSTQycWF0U1ZXU0szZG8z?=
 =?utf-8?B?QUQ1cVVCZ3I0YXVwOTNYaTM0RytSamc4Z0J6SCtFRjJWdjZoSE5McFlhd3Js?=
 =?utf-8?B?T3RyRVdLZmR2YnhhWFhVcEtZQm9qUVhNdTFrc2NLblh6Qk5aUTY3eWdCbjdE?=
 =?utf-8?B?Y0d6cjlpRjViUThYSFZnUHJ2TTQ3Z05LT3llM0hjQnFMZThUK3Y1Tk1RUDlI?=
 =?utf-8?B?UlhuTkplRHZvMC80QjAwdGRGR3BSQjIyYTRJdXZDTU9tMjdWdW5HZm4vWk40?=
 =?utf-8?B?djBnUThrUHVUcW4zN3o1ek1ZQ21qZVkyTVlQTmd6MlZLTVBpQStFL083UnJC?=
 =?utf-8?B?QW9kQURaRTd6SFJyTUw5K3ZzY3NMTkpFVG5uMk5qa2h0aDNXVDM2c2hvdGJY?=
 =?utf-8?B?QWZUYVo5NW53amhRMWNTdnFIQ2VrazlicVZFR2NucHZ5czZLSEt0S3NWZk16?=
 =?utf-8?B?OUFRMGd2UUl6OWVHOFpuOHRBSW9PaEh2WFNsMmV1bmVGTVhyQjhySHltYVFS?=
 =?utf-8?Q?amj7GFDglLksT+26Tzq/vsSQv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E7DC28EB3A7244C8E54586F7A3574F5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?RUk4ZnI5TklWYzVzMVUxb2pvVy8yTnVjYkN5b2FmYXFmRlprbnZFVDNtekFl?=
 =?utf-8?B?TWpsdzZIb29CRW1OaTI1c01BdDBsVUV6WC83MjJJTG92NmVpUlM4YjNONHAy?=
 =?utf-8?B?bmdOYitMN3RkZjUyanE2c0ZjZkVuV1BaVlpMQ2tYN3BPbEhlV2p4U2RHd0VX?=
 =?utf-8?B?YVI1VTR1NVdHakxFb215NGV4cWpwV1krQnpPU056b3FHNG0vZTF4T1NVY3Bi?=
 =?utf-8?B?UE5BU2tvTnRMK3dZbVY3OVhvdElRK0hrWTVWeUN2RVpoVEFsNC9NWHNTWW9o?=
 =?utf-8?B?M1lNWlBkZ0lteUF3NWROT3MyTElFV3pRcTJPVXhYWk91R1U3OW0zQzNpN2Vp?=
 =?utf-8?B?TEU2TmlGTmtVWTB3MXJTM0VmNDg3bURpUTh2S1ZrK3E1STNlREtkNTFHdG5v?=
 =?utf-8?B?bFhQMGI0STMyYlJ2eUs0eFEwaFFwdVBiRzdrVmJoSVJXWnRWREtWNGlLNVpF?=
 =?utf-8?B?UTdqUFhIOTBkZDROU09SWTYrOUNJLzQvRUZCUVplbWhIN3lnajI5blFQVGQ5?=
 =?utf-8?B?QjRRcmoxZW5JakkxRHdrYlJZK0NNUnlua2FrZnNQY2JCOHJsVEFuMFFDZUJ1?=
 =?utf-8?B?WUEwd2F1Wi9pMENzRk5taWJNUXdYS0gyaS9jckFqdVgwa1djSjMvSzlha2g0?=
 =?utf-8?B?OUF0QzBvQTFtZGVadjdidkFiQllVQ0NnUWVwbkhOQlhLMVBpWUtvUjg3M0Ny?=
 =?utf-8?B?ZzBPTUlVaEVNVWdtUmxxM2lhNGNaVHpieEo4Y3ZKZnN0QkVJVFkrTEJMZHVw?=
 =?utf-8?B?NEtLUzFGQ1V0ODJlSUFhWlNsYWdCUTJjNkx0ZEE5ZFQyakdZaWFaTzVldzdl?=
 =?utf-8?B?aDl5bVEvOXdpRFZEZzZRRSsvN0VzTExDZkN4aXRWWmt6b21lc2VLM21kdHBV?=
 =?utf-8?B?T2lSckthRWRyalhOVnBDMXB3NG9aWkk3K2dyQjc5SzFjeFM3MGd6L1cvYmdR?=
 =?utf-8?B?ODhwZm81VVVrSnRjanVFVzQ3UzhwSlY5SXUvRmdZaFhoVHVvb1VoaXpVWUM5?=
 =?utf-8?B?TzdrRDdJU3ZXV1gyc25Bc0FIekR3bktxUnB3TjlEVzJKRzJkTExEK0h1dVV0?=
 =?utf-8?B?Y09yekdCQWxsS1VuWHBkanRoK2dlUFRxMHk4QkNQRmVqK1ZRcElGTUlOclJi?=
 =?utf-8?B?ZEJoOGZXT0dHemtHamIwUWVHMUN5MWtVdFRWUE5ZNS9RdUxZc0xpRDhPQndx?=
 =?utf-8?B?Y0NxQTVJc2NXKzVSQU9Qb1R2OFZwaEl0YUs4NU5YTVdVb0lUd2kvOCtTQlJ0?=
 =?utf-8?B?YXhBaXFUb1k0WjBOSThwdVJoUTVhZVlDdFlucnJRRS96YUpCZz09?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef6d268-dcca-4cf5-d5b8-08db84028f50
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 00:37:53.2075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LEKMteVD48B3bS+GA+g1S57i7lCqwMGXAnDf0Tv5bWJxCto99yqc+BLJt4QN9s7iOjcpgArI61dpVMRU/776bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5356
X-Proofpoint-GUID: rXHYfP1l9iTlHgL2bbk_om9QvOMuiogz
X-Proofpoint-ORIG-GUID: rXHYfP1l9iTlHgL2bbk_om9QvOMuiogz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_12,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307140003
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

T24gVGh1LCBKdWwgMTMsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBPbiBXZWQsIEp1
bCAwNSwgMjAyMyBhdCAxMToyNTo0NlBNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4g
T24gU3VuLCBKdWwgMDIsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiA+ID4gRnJvbTog
TGFkaXNsYXYgTWljaGwgPGxhZGlzQGxpbnV4LW1pcHMub3JnPg0KPiA+ID4gDQo+ID4gPiBNb3Zl
IE9jdGVvbiBEV0MzIGdsdWUgY29kZSBmcm9tIGFyY2gvbWlwcyBhbmQgdXNlIGl0DQo+ID4gPiBp
bnN0ZWFkIG9mIGR3YzMtb2Ytc2ltcGxlLg0KPiA+IA0KPiA+IFBsZWFzZSBwcm92aWRlIG1vcmUg
Y29udGV4dCBhbmQgdGhlIHJlYXNvbiB0byB3aHkgdGhlIG1vdmUgaGVyZS4NCj4gPiANCj4gPiA+
IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkaXNsYXYgTWljaGwgPGxhZGlzQGxpbnV4LW1pcHMu
b3JnPg0KPiA+ID4gQWNrZWQtYnk6IFRob21hcyBCb2dlbmRvZXJmZXIgPHRzYm9nZW5kQGFscGhh
LmZyYW5rZW4uZGU+DQo+ID4gPiAtLS0NCj4gPiA+ICBDSEFOR0VTOg0KPiA+ID4gIC0gdjI6IHNx
dWFzaGVkIG1vdmUgYW5kIGdsdWUgY29udmVyc2lvbiBwYXRjaCwgZml4ZWQgc3BhcnNlIHdhcm5p
bmcNCj4gPiA+ICAgICAgICBhbmQgZm9ybWF0dGluZyBpc3N1ZS4gU2V0IHByaXZhdGUgZGF0YSBh
dCB0aGUgZW5kIG9mIHByb2JlLg0KPiA+ID4gICAgICAgIENsZWFyIGRydmRhdGEgb24gcmVtb3Zl
LiBBZGRlZCBob3N0IG1vZGUgb25seSBub3RpY2UuDQo+ID4gPiAgICAgICAgQ29sbGVjdGVkIGFj
ayBmb3IgbW92ZSBmcm9tIGFyY2gvbWlwcy4NCj4gPiA+IA0KPiA+ID4gIGFyY2gvbWlwcy9jYXZp
dW0tb2N0ZW9uL01ha2VmaWxlICAgICAgICAgICAgICB8ICAgMSAtDQo+ID4gPiAgYXJjaC9taXBz
L2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXBsYXRmb3JtLmMgICAgIHwgICAxIC0NCj4gPiA+ICBkcml2
ZXJzL3VzYi9kd2MzL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKysNCj4gPiA+
ICBkcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0K
PiA+ID4gIC4uLi91c2IvZHdjMy9kd2MzLW9jdGVvbi5jICAgICAgICAgICAgICAgICAgICB8IDEw
OCArKysrKysrKysrLS0tLS0tLS0NCj4gPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2Ytc2lt
cGxlLmMgICAgICAgICAgICAgfCAgIDEgLQ0KPiA+ID4gIDYgZmlsZXMgY2hhbmdlZCwgNjkgaW5z
ZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25zKC0pDQo+ID4gPiAgcmVuYW1lIGFyY2gvbWlwcy9jYXZp
dW0tb2N0ZW9uL29jdGVvbi11c2IuYyA9PiBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMg
KDkxJSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9u
L01ha2VmaWxlIGIvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vTWFrZWZpbGUNCj4gPiA+IGluZGV4
IDdjMDJlNTQyOTU5YS4uMmE1OTI2NTc4ODQxIDEwMDY0NA0KPiA+ID4gLS0tIGEvYXJjaC9taXBz
L2Nhdml1bS1vY3Rlb24vTWFrZWZpbGUNCj4gPiA+ICsrKyBiL2FyY2gvbWlwcy9jYXZpdW0tb2N0
ZW9uL01ha2VmaWxlDQo+ID4gPiBAQCAtMTgsNCArMTgsMyBAQCBvYmoteSArPSBjcnlwdG8vDQo+
ID4gPiAgb2JqLSQoQ09ORklHX01URCkJCSAgICAgICs9IGZsYXNoX3NldHVwLm8NCj4gPiA+ICBv
YmotJChDT05GSUdfU01QKQkJICAgICAgKz0gc21wLm8NCj4gPiA+ICBvYmotJChDT05GSUdfT0NU
RU9OX0lMTSkJICAgICAgKz0gb2N0X2lsbS5vDQo+ID4gPiAtb2JqLSQoQ09ORklHX1VTQikJCSAg
ICAgICs9IG9jdGVvbi11c2Iubw0KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9jYXZpdW0t
b2N0ZW9uL29jdGVvbi1wbGF0Zm9ybS5jIGIvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9u
LXBsYXRmb3JtLmMNCj4gPiA+IGluZGV4IGNlMDVjMGRkM2FjZC4uMjM1Yzc3Y2U3YjE4IDEwMDY0
NA0KPiA+ID4gLS0tIGEvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXBsYXRmb3JtLmMN
Cj4gPiA+ICsrKyBiL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL29jdGVvbi1wbGF0Zm9ybS5jDQo+
ID4gPiBAQCAtNDUwLDcgKzQ1MCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IG9jdGVvbl9pZHNbXSBfX2luaXRjb25zdCA9IHsNCj4gPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJj
YXZpdW0sb2N0ZW9uLTM4NjAtYm9vdGJ1cyIsIH0sDQo+ID4gPiAgCXsgLmNvbXBhdGlibGUgPSAi
Y2F2aXVtLG1kaW8tbXV4IiwgfSwNCj4gPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJncGlvLWxlZHMi
LCB9LA0KPiA+ID4gLQl7IC5jb21wYXRpYmxlID0gImNhdml1bSxvY3Rlb24tNzEzMC11c2ItdWN0
bCIsIH0sDQo+ID4gPiAgCXt9LA0KPiA+ID4gIH07DQo+ID4gPiAgDQo+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnIGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnDQo+
ID4gPiBpbmRleCBiZTk1NGE5YWJiZTAuLjk4ZWZjYmI3NmM4OCAxMDA2NDQNCj4gPiA+IC0tLSBh
L2RyaXZlcnMvdXNiL2R3YzMvS2NvbmZpZw0KPiA+ID4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9L
Y29uZmlnDQo+ID4gPiBAQCAtMTY4LDQgKzE2OCwxNCBAQCBjb25maWcgVVNCX0RXQzNfQU02Mg0K
PiA+ID4gIAkgIFRoZSBEZXNpZ253YXJlIENvcmUgVVNCMyBJUCBpcyBwcm9ncmFtbWVkIHRvIG9w
ZXJhdGUgaW4NCj4gPiA+ICAJICBpbiBVU0IgMi4wIG1vZGUgb25seS4NCj4gPiA+ICAJICBTYXkg
J1knIG9yICdNJyBoZXJlIGlmIHlvdSBoYXZlIG9uZSBzdWNoIGRldmljZQ0KPiA+ID4gKw0KPiA+
ID4gK2NvbmZpZyBVU0JfRFdDM19PQ1RFT04NCj4gPiA+ICsJdHJpc3RhdGUgIkNhdml1bSBPY3Rl
b24gUGxhdGZvcm1zIg0KPiA+ID4gKwlkZXBlbmRzIG9uIENBVklVTV9PQ1RFT05fU09DIHx8IENP
TVBJTEVfVEVTVA0KPiA+ID4gKwlkZWZhdWx0IFVTQl9EV0MzDQo+ID4gPiArCWhlbHANCj4gPiA+
ICsJICBTdXBwb3J0IENhdml1bSBPY3Rlb24gcGxhdGZvcm1zIHdpdGggRGVzaWduV2FyZSBDb3Jl
IFVTQjMgSVAuDQo+ID4gPiArCSAgT25seSB0aGUgaG9zdCBtb2RlIGlzIGN1cnJlbnRseSBzdXBw
b3J0ZWQuDQo+ID4gPiArCSAgU2F5ICdZJyBvciAnTScgaGVyZSBpZiB5b3UgaGF2ZSBvbmUgc3Vj
aCBkZXZpY2UuDQo+ID4gPiArDQo+ID4gPiAgZW5kaWYNCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9kd2MzL01ha2VmaWxlIGIvZHJpdmVycy91c2IvZHdjMy9NYWtlZmlsZQ0KPiA+ID4g
aW5kZXggOWY2NmJkODJiNjM5Li5mZTE0OTNkNGJiZTUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL01ha2VmaWxlDQo+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL01ha2Vm
aWxlDQo+ID4gPiBAQCAtNTQsMyArNTQsNCBAQCBvYmotJChDT05GSUdfVVNCX0RXQzNfU1QpCQkr
PSBkd2MzLXN0Lm8NCj4gPiA+ICBvYmotJChDT05GSUdfVVNCX0RXQzNfUUNPTSkJCSs9IGR3YzMt
cWNvbS5vDQo+ID4gPiAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX0lNWDhNUCkJCSs9IGR3YzMtaW14
OG1wLm8NCj4gPiA+ICBvYmotJChDT05GSUdfVVNCX0RXQzNfWElMSU5YKQkJKz0gZHdjMy14aWxp
bngubw0KPiA+ID4gK29iai0kKENPTkZJR19VU0JfRFdDM19PQ1RFT04pCQkrPSBkd2MzLW9jdGVv
bi5vDQo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXVz
Yi5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jDQo+ID4gPiBzaW1pbGFyaXR5IGlu
ZGV4IDkxJQ0KPiA+ID4gcmVuYW1lIGZyb20gYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9u
LXVzYi5jDQo+ID4gPiByZW5hbWUgdG8gZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jDQo+
ID4gPiBpbmRleCAyYWRkNDM1YWQwMzguLjhkNWZhY2Q4ODFjMSAxMDA2NDQNCj4gPiA+IC0tLSBh
L2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL29jdGVvbi11c2IuYw0KPiA+ID4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jDQo+ID4gPiBAQCAtMTg3LDcgKzE4NywxMCBAQA0KPiA+
ID4gICNkZWZpbmUgVVNCRFJEX1VDVExfRUNDCQkJCTB4ZjANCj4gPiA+ICAjZGVmaW5lIFVTQkRS
RF9VQ1RMX1NQQVJFMQkJCTB4ZjgNCj4gPiA+ICANCj4gPiA+IC1zdGF0aWMgREVGSU5FX01VVEVY
KGR3YzNfb2N0ZW9uX2Nsb2Nrc19tdXRleCk7DQo+ID4gPiArc3RydWN0IGR3YzNfZGF0YSB7DQo+
ID4gPiArCXN0cnVjdCBkZXZpY2UgKmRldjsNCj4gPiA+ICsJdm9pZCBfX2lvbWVtICpiYXNlOw0K
PiA+ID4gK307DQo+ID4gPiAgDQo+ID4gPiAgI2lmZGVmIENPTkZJR19DQVZJVU1fT0NURU9OX1NP
Qw0KPiA+ID4gICNpbmNsdWRlIDxhc20vb2N0ZW9uL29jdGVvbi5oPg0KPiA+ID4gQEAgLTIzMyw2
ICsyMzYsMTEgQEAgc3RhdGljIGlubGluZSB1aW50NjRfdCBkd2MzX29jdGVvbl9yZWFkcSh2b2lk
IF9faW9tZW0gKmFkZHIpDQo+ID4gPiAgc3RhdGljIGlubGluZSB2b2lkIGR3YzNfb2N0ZW9uX3dy
aXRlcSh2b2lkIF9faW9tZW0gKmJhc2UsIHVpbnQ2NF90IHZhbCkgeyB9DQo+ID4gPiAgDQo+ID4g
PiAgc3RhdGljIGlubGluZSB2b2lkIGR3YzNfb2N0ZW9uX2NvbmZpZ19ncGlvKGludCBpbmRleCwg
aW50IGdwaW8pIHsgfQ0KPiA+ID4gKw0KPiA+ID4gK3N0YXRpYyB1aW50NjRfdCBvY3Rlb25fZ2V0
X2lvX2Nsb2NrX3JhdGUodm9pZCkNCj4gPiA+ICt7DQo+ID4gPiArCXJldHVybiAxNTAwMDAwMDA7
DQo+ID4gPiArfQ0KPiA+ID4gICNlbmRpZg0KPiA+ID4gIA0KPiA+ID4gIHN0YXRpYyBpbnQgZHdj
M19vY3Rlb25fZ2V0X2RpdmlkZXIodm9pZCkNCj4gPiA+IEBAIC0yNzEsNyArMjc5LDcgQEAgc3Rh
dGljIGludCBkd2MzX29jdGVvbl9jb25maWdfcG93ZXIoc3RydWN0IGRldmljZSAqZGV2LCB2b2lk
IF9faW9tZW0gKmJhc2UpDQo+ID4gPiAgCQkJZGV2X2VycihkZXYsICJpbnZhbGlkIHBvd2VyIGNv
bmZpZ3VyYXRpb25cbiIpOw0KPiA+ID4gIAkJCXJldHVybiAtRUlOVkFMOw0KPiA+ID4gIAkJfQ0K
PiA+ID4gLQkJZHdjM19vY3Rlb25fY29uZmlnX2dwaW8oKCh1NjQpYmFzZSA+PiAyNCkgJiAxLCBn
cGlvKTsNCj4gPiA+ICsJCWR3YzNfb2N0ZW9uX2NvbmZpZ19ncGlvKCgoX19mb3JjZSB1NjQpYmFz
ZSA+PiAyNCkgJiAxLCBncGlvKTsNCj4gPiANCj4gPiBZb3UncmUgZG9pbmcgbW9yZSB0aGFuIGp1
c3QgbW92aW5nIHRoZSBjb2RlIGhlcmUuIFBsZWFzZSBzZXBhcmF0ZSB0aGUNCj4gPiBjaGFuZ2Ug
dG8gYSBkaWZmZXJlbnQgcGF0Y2ggaWYgdGhlcmUgYXJlIGFkZGl0aW9uYWwgZnVuY3Rpb25hbCBj
aGFuZ2UNCj4gPiBhbmQgcHJvdmlkZSB0aGUgcmVhc29uIGZvciBpdC4NCj4gDQo+IElzIGl0IG9r
YXkgdG8gbW92ZSBmaWxlIHdpdGggc3BhcnNlIHdhcm5pbmcgb3IgYW0gSSBzdXBwb3NlZCB0byBm
aXggaXQNCj4gaW4gdGhlIGFyY2ggY29kZSBmaXJzdD8NCj4gDQoNClllcy4gS2VlcCB0aGUgY2hh
bmdlIHRvIG9ubHkgd2hhdCBpcyBkZXNjcmliZWQgaW4gdGhlIGNoYW5nZSBsb2cuIEFueQ0Kb3Ro
ZXIgY2hhbmdlIHNob3VsZCBiZSBpbiBhIHNlcGFyYXRlIGNvbW1pdC4NCg0KVGhhbmtzLA0KVGhp
bmg=
