Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E910274453B
	for <lists+linux-mips@lfdr.de>; Sat,  1 Jul 2023 01:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjF3X1t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jun 2023 19:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjF3X1s (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jun 2023 19:27:48 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94251BD;
        Fri, 30 Jun 2023 16:27:47 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35UIPmEZ009771;
        Fri, 30 Jun 2023 16:27:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=CHXxgGqEza1CMabsC30skyyduD4QQxnYby6MVJ2PSF4=;
 b=vCMFVtzy36U85/t3oIFi446ixzLyIb2zVIzhsLNP9+VhcXSbOaA1YHOSG6ugPaMfenCw
 7rEVxb3fj99cFzymNaBIcZLP3EbR13lX1Mij1B9a0qsA60ixnTsfeTgNLW2N1fpJhReL
 /x1/p/wXiCJzZuCzS4zBQnQtzlyqYXBe88FZzGnDtYIqblJdNU/YErBxeenkm5Yek/12
 cVfmjS+1IBp3cVmrQ5t8cVXDhkQPZYouWmB55+tKsoa+LUK8W8Nse03UeJV4uBhEfYWa
 79l0/d+MzvIC7YXIt05SGhdcpvhG9epdi1GJzPc7hOuQPHOawkWxd5sxJJxG84vuZUjK fQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3rdyduk146-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 16:27:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1688167663; bh=CHXxgGqEza1CMabsC30skyyduD4QQxnYby6MVJ2PSF4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RAbwTHCcVvzzGfNF8I84AsGWz8w0UAmXaNhw7Ph8/N5FeJRkV4bktmOSQEkr4EinP
         qNUZr1nsZKR7bO2+OigH8uK3CX0X67VrJmiUmSljxzN/F8zlgRMwK3tjKNGhmkhA48
         vdJ83iEGaoNDKjqvAR/G7EbwF5/98UdqT7P7rVTaMP3PMItMfQx/Tzr7EBsgRTl4C9
         g2PHYkv0s4EVJm6Q8XTNd0vGAlFu3dykYb+wWk+8A1nJkv27P/NevXbeewPYBDxZpe
         c4ptxU4ZlSRzxkAuDk6q6lo2VAB2BgliNbTTnTua7bVAt0pCFqeZzFoaILpEHTHmG3
         IgNYwE8d7wr9w==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5397B404CE;
        Fri, 30 Jun 2023 23:27:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7A5EEA0080;
        Fri, 30 Jun 2023 23:27:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MxU2Igla;
        dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6163040236;
        Fri, 30 Jun 2023 23:27:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6Jw2ZActaaWnZhBi/CRmvs6JlGTlP4gwi8xeIro+9guAMi+cQgTGQgq2IWTUMuZnQu5xsGixEzDFTR3Lf22dg56bGPLYezRYTjEDkoBoR/HiZK9cs3+tatUSp/tSv7us9s52kNWei79XaeEfOKOtQ6LQkv1c06B25LQ3luenbIisgF4dtAGzsTSfMhuvvhidQLZ18s+XwLFmyGF/9CrajhbeGpYBB/12jqKd84ZLyBkLvwHMFphqullvwq2HWxfWJmDlD6yXnz/vI61QcWVDCHXvxMtWXmlP4D5TrjcI+vbaMefRX4HrIPIczreFdlhSJz6YfEpHW3h2DZPD/s7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHXxgGqEza1CMabsC30skyyduD4QQxnYby6MVJ2PSF4=;
 b=fci92H9Y3MT6ZT4UUIoTVFOJPGuGeWOThBeis03pAbLbqzcZgqsjZZ3rvQxyJWzf29rVJoPrTzDnNr10LCG7b+RHFJm9rayr9j5OmTIBpbafIJE549fosNzuLxczb95g6UmZd1+rdBHdcCHCLzEiXkXyqzf9C97OezlmxmPSCMt9sv7v5awyTn5Enhl4WKmmlDsWcsITpnZ06ft4UAvUeVWng9lXqpw8b4rxDBgVym/4QklmtiIqAGAoHm21JEqR2kC6oEUKHQEfpBtAImwPXAWGzCM4jlPPbusnB0+GQbK60wXL2M4VXvHDuVaYPGdHM8qUIfYhiMI9sMWMgUTvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHXxgGqEza1CMabsC30skyyduD4QQxnYby6MVJ2PSF4=;
 b=MxU2Iglae/cJJhzbDSnR/GZ09SBPyYkvI9d58Z0cKJtwJRQd7mFOVGUT+kAGZgyHbYcM4w+LTM7PzOyok4uwtg9V1LTtyrmtRm0MUAxQUyBTUG7htaherezjtyPvqgwPjfK2t6S3A6oXLzP3d7++qyeKMlxfC2YFAe9h3AgnQyg=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Fri, 30 Jun
 2023 23:27:38 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b%3]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 23:27:38 +0000
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
Thread-Index: AQHZourfmmGdZN05YkqqS/Vo8kRsxq+kDw6A
Date:   Fri, 30 Jun 2023 23:27:37 +0000
Message-ID: <20230630232733.rvibxvrcqkkj7dpw@synopsys.com>
References: <ZJC165p0Mj4jHcBh@lenoch> <ZJC3eK8QMxShyZDt@lenoch>
In-Reply-To: <ZJC3eK8QMxShyZDt@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MN0PR12MB5953:EE_
x-ms-office365-filtering-correlation-id: 43a4ba88-f152-48ab-ac7e-08db79c19768
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: leCV2f+doq0DxbBMz+OdSR9k86pkPgyc4W4t7i/CQZAD3quREqW958pcnMk+GCguua0Vwk0T4TXIDfSsz45mpTobvIeohtos5RHIxoANaoq4Yxadfud0NaPtiLGXfBHq5Koa/vZ5YEEp7cHf/Pm/qyM/FhxlpmgeogZfhv8MxMzyb5jDut57uwZ1rmOf10BGDOsFOrWp7F7dVISugSLdmD+pk+KeUeqI5gEG7dp4Qd/CdIgSHdv7w2ryMdZJGMa7Mm1Y/O/Z4O6rUMfTN8x8QvvvhlY524hM73lMDarE/3ygLv4p8fGb9yzO6R5glX7YFO8BLfHUdw1EVWrO9gFV3716YU2nkxQfE9QTEZ4l+06HKEre0GrhYSaoWfpCRXO5D5YqSuCHxZt4qRvMO2P4+tq3osVkgSf6VuvBZdaGo/lDQXqYOzg9/Vk5vBUr9mnxV9BYHkrWthLq4Wk9fgXPyJbx9K7KkJSrY9y3S3Uvc/HWdGRivunLEBE5GQ6xr+cD7J7UOPB1Z+TJuRpDBKNg+GzAH3rcrEgynHn1SsT0Rlw8VGl7QuaPPjACF0WNI8iek45TScycJaa8p311W3YAA9t3cChm3tVHbnipLFuPKEhLUXc4gmEB0D7RK3lWP5Jr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199021)(6486002)(38100700002)(71200400001)(2616005)(83380400001)(122000001)(6506007)(26005)(186003)(1076003)(6512007)(54906003)(86362001)(41300700001)(38070700005)(316002)(36756003)(2906002)(76116006)(66556008)(6916009)(66446008)(66946007)(64756008)(4326008)(66476007)(5660300002)(8676002)(8936002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEMzMXVUVWRZdHA4MHdoRUEzZitjbjhiVDNvRWFMczIxUzc1dmdNVnk2aWZa?=
 =?utf-8?B?YnFSOCtMeE1ydGxnR2EvQ0pLZWUraGxGdFZRc2NRKzQvUVpwbmovakNNZXMy?=
 =?utf-8?B?K3lCbjdRcTJEYlFMNnVtMUNKUm9rMVE1NnBkNnFwSUtxU091bHVqTWNYa2s2?=
 =?utf-8?B?bXFHTUVqWkJUZG5qR2htMlUwdTJUMWZUMjlQK09zWnE1Kyt5a1hLeVNiSU9Y?=
 =?utf-8?B?SDc3RTZUUTJHaUVoOE9yUlNnTWhaazdmWXlTMThLb3R3MjIyZFVyRFlhbVBr?=
 =?utf-8?B?Sml4VmQwMk9qZldRZVFQRDV5cHVPN2V2Mk1Vd2oybEp5TXlWdVc4Y1pyWjdI?=
 =?utf-8?B?MVZYR2FiM0ViRlN6ZHNkdE1qd2xqbDJxREg1eGU3UXFUN0hYcnRKY0tJaGFJ?=
 =?utf-8?B?UDB4MnQxVkhVTmV0cHBBaEU2ZGRuK2ZpbS9nZmNoT1ZCM2d6K25lSVFJeUZS?=
 =?utf-8?B?OUIraFI2Z3Q3azU4TmhvcDRwdTE3dkxka0ZWQVJpVEwvb0ExOVVXaVFFM09x?=
 =?utf-8?B?WnJCZTZhOHkzSUpBWU9HemQ4Mjk4K25lT0pieC96dHU0Z20vWmhpdjRpbzM5?=
 =?utf-8?B?ZUlBb3V1R0hQeEprL0VrRktQcFd0UEw2cTVnY09oakdoa3JXaTBNcHlaM3Rw?=
 =?utf-8?B?OER2bDBQVlVwZGRMVGJTZ0cvRDBVb1RuVENWMFVIT2NXc3lJZE1yajJES3c3?=
 =?utf-8?B?RmNRa3BISkdlcXVJOVdmaUsxMXI3eURwYnE0Qzd0Z3VmaUtmNmZhMFBYd0Nz?=
 =?utf-8?B?RUZBVTNSOVJXTnIwVVdMcnZvVUJhak5xSy9LRG04WjU1S24xcG5ncG9FeWxo?=
 =?utf-8?B?WWVVZzNnaGhCbGxkNXdjNEpManAwdUsyS3czNXZiMUZ0YlB5b29kVU54SHNO?=
 =?utf-8?B?WTY5d08zRU5jekFPV3Jnc3UvcFdMWU9oR3dzK3pOeDlpTE1sYkdBRU9mS0Jr?=
 =?utf-8?B?MHllUDZScXZHQTNTMGRlckxjQ3VoaXVwaEFyRUU4dWpLN3FBNnpMRW55OGhT?=
 =?utf-8?B?Z2lKS01WaWZLN2YzYXNyOEl3a09rZFJ5WEUwQkovblFrYkxSaXJ6R0xqMXV2?=
 =?utf-8?B?Mk1kV1AvemR6REt1NVdwV2dQamZWY29TK2Q0UlpDRlZxdk9sRUZQaE5YWDNO?=
 =?utf-8?B?ZUZ6R1YrTkRVZ2kvS05LYVplNXE3cldZcnR5TjE3QTcrTFdMUHlmR1dodGtr?=
 =?utf-8?B?TnBkTnFNRC9rQ09rUlZNb04xVnFGVDFuV2ppMG56czlFSTV6Yk5ja0lwaGQy?=
 =?utf-8?B?WGw4OFRQU3JTemhhaE5VWm03K0pIcDlMT2NpU1VWQ013bU1jaDR3Qk5zR29j?=
 =?utf-8?B?a0s4aU9SOUFZb3ZiRlF6QlE3dnQ2RWcrd0NOL1FhZUJ3R1JZQncrY041VWhh?=
 =?utf-8?B?KzZkS1grMlRVNnEvWWVlbWxxbnBaem1Sb1lJdllOT1M5MGJxQ1RINFZYcUVO?=
 =?utf-8?B?a0ViRkJBWnVlbHZQY2lHOXlVeEJLSitYaHFNb1pldUpBV256YVAwd1g1eXN0?=
 =?utf-8?B?dXRNU0N6eDJoekU4bG52cTJka3RJMzY4dWIrUUw4RzBmMFMrNkNLaWtQZnhI?=
 =?utf-8?B?S2ZBaDFMQnFRQngxRjYvQlFsUm1WWE92aDZhdVFIcTJ2eHNweHFycjF1VEl3?=
 =?utf-8?B?M3p4Y3pDYTN2RlprRk1leHh6ODM1VU1lck52QzdLUjk1OXpYWTU5aSt2RjY1?=
 =?utf-8?B?TWJQMXlVVTZ6VEtJUklLa1JlbVdpK3VETUl5OXJ6bGRFWVhvR1QzS0xYT3hY?=
 =?utf-8?B?UWswM0tySXhzWEFvczFod3ZXTjIzY2REcjY3Tlg2ZHdMME10RjgxZFJjSlha?=
 =?utf-8?B?YndscnpoSzNMbmJNY20wS0F4SDk0eVhEcFRzMTNpaWhzTEgzZGV2Sm02REdW?=
 =?utf-8?B?SW9OTkNOR0ozSGJYOHhDdW1hd0ZzcWpQbGdKZkFIL2xFbmtxMC9ITTJwYXlP?=
 =?utf-8?B?K2dpWmFEcURhb0Y4ZTAyek9PbjMybDNKMVpzRGpVa0xZZG0wRjhHT2laK01X?=
 =?utf-8?B?RzIwWlNMaXFPa1B4THlyQnFSbm4zR0FEWEwxb3g0ZFdzVm5RNVk4UkNyT2Rs?=
 =?utf-8?B?ZGRiS3NnSlZsc1VKV2hyQUNjekNnQ2NrQ2pLOFZtR21mZWhFZ1ZCbzdPeDUw?=
 =?utf-8?Q?2DEXjH7898Y60GV8Fx3jac4Pr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44BC50B95D142C4AA0E9EACDB2BBEB6D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: gxh3/4cjZwQdb0WY7Avq7xcQ2qtooW9YaBBhGu/Vd7B7pu1+dE1vS1rFfAcbmZgdTUDJnY7o9fwEeeyh9pPT1gpmf50V0utG39Kh7M4yBTtenYX3/xkCVs9j9Qk/FhrWLlWTHZpDwZzwYOVzyhIzd++hQnqSJdC48drBhbQHlWU8gGDNqCJ8i3vIFMxB29Ue3gtIew8VRbnKrL1T36nb+paSilppGixYd7XA8vufEfm9Wrf6jVt2EUJKaHTaHpaCb9wGjc87S+lLkM+SN2ddxLPv6WqhZWwUisZLuhRVS0/WzQ7E0OyK3n/xfmlBp6hCbMvMyDXalUL7JoFw/QvP3xFtqV+3YQ/uLpEes20JEAFePEMRTmVFaUKFViS7rcgFpHdbtYGQ+IryNMWzeQejI3Ci7eTqPjZRQnTWk3X8zxfAOZ66lqdqkdWJ5+sh2Ijpf0O03s1Z3n0dykyirBOPAR1iMk/T27jT7brtrKx45YmCY02Vrwz5UB9U/2CTyK+QokjpZQNqGu29JxPf9G9KqR2Uba/HQMPbctpekexnvANUz/Tby/bsUfV+Neztpxfigsg08IfGdgbaAbE7HGeGVGQ00HLrgKMGbowkdiP9pNrVUm8wobh6jWaKU/VpZnsVfOhtQWVs1I7BZF6jGLMnQHp3TToBmpUJR9TDXzqYHtsnY7dqi/pNUtF2KDgOTTMv+47K/gTZtBWm7p5PbIOiOmXERP8ZE3jvR7qY6V6lJfLxvxkuebs3ZyOAEpN1i+ZOgJWLEiSQC3JG55QYgPJTGSkK7BdcKTfjdpIqMgjU6yedpjaaTttGDzhTDk7jnc66gWBaY+b7a3sSMUjizapvGg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a4ba88-f152-48ab-ac7e-08db79c19768
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 23:27:37.8638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TgvGX+0jXfayWYrqNTQoCvKrFKQ5+7R4gBYTsSA81amR3+JjTdBiHT0ccE2VQSKVVUxXHLVY9MD9KafOxzNI0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5953
X-Proofpoint-GUID: BSaE5QgO1Ok1mLlrMxPAUqz7sZfO4E6z
X-Proofpoint-ORIG-GUID: BSaE5QgO1Ok1mLlrMxPAUqz7sZfO4E6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_13,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306300206
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
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBNYWtlIGR3YzNfb2N0ZW9u
X2Nsb2Nrc19zdGFydCBqdXN0IHN0YXJ0IHRoZSBjbG9ja3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBMYWRpc2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVy
cy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jIHwgMTUwICsrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDc5IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYyBi
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiBpbmRleCAzZWJjZjJhNjEyMzMuLjRh
ZDJkODg4N2NmMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5j
DQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiBAQCAtMjk1LDY3ICsy
OTUsMTQgQEAgc3RhdGljIGludCBkd2MzX29jdGVvbl9jb25maWdfcG93ZXIoc3RydWN0IGRldmlj
ZSAqZGV2LCB2b2lkIF9faW9tZW0gKmJhc2UpDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4g
LXN0YXRpYyBpbnQgZHdjM19vY3Rlb25fY2xvY2tzX3N0YXJ0KHN0cnVjdCBkZXZpY2UgKmRldiwg
dm9pZCBfX2lvbWVtICpiYXNlKQ0KPiArc3RhdGljIGludCBkd2MzX29jdGVvbl9jbG9ja3Nfc3Rh
cnQoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkIF9faW9tZW0gKmJhc2UsDQo+ICsJCQkJICAgIGlu
dCByZWZfY2xrX3NlbCwgaW50IHJlZl9jbGtfZnNlbCwNCj4gKwkJCQkgICAgaW50IG1wbGxfbXVs
KQ0KPiAgew0KPiAtCWludCBpLCBkaXYsIG1wbGxfbXVsLCByZWZfY2xrX2ZzZWwsIHJlZl9jbGtf
c2VsID0gMjsNCj4gLQl1MzIgY2xvY2tfcmF0ZTsNCj4gKwlpbnQgZGl2Ow0KPiAgCXU2NCB2YWw7
DQo+ICAJdm9pZCBfX2lvbWVtICp1Y3RsX2N0bF9yZWcgPSBiYXNlICsgVVNCRFJEX1VDVExfQ1RM
Ow0KPiAgDQo+IC0JaWYgKGRldi0+b2Zfbm9kZSkgew0KPiAtCQljb25zdCBjaGFyICpzc19jbG9j
a190eXBlOw0KPiAtCQljb25zdCBjaGFyICpoc19jbG9ja190eXBlOw0KPiAtDQo+IC0JCWkgPSBv
Zl9wcm9wZXJ0eV9yZWFkX3UzMihkZXYtPm9mX25vZGUsDQo+IC0JCQkJCSAicmVmY2xrLWZyZXF1
ZW5jeSIsICZjbG9ja19yYXRlKTsNCj4gLQkJaWYgKGkpIHsNCj4gLQkJCWRldl9lcnIoZGV2LCAi
Tm8gVUNUTCBcInJlZmNsay1mcmVxdWVuY3lcIlxuIik7DQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gLQkJfQ0KPiAtCQlpID0gb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcoZGV2LT5vZl9ub2RlLA0K
PiAtCQkJCQkgICAgInJlZmNsay10eXBlLXNzIiwgJnNzX2Nsb2NrX3R5cGUpOw0KPiAtCQlpZiAo
aSkgew0KPiAtCQkJZGV2X2VycihkZXYsICJObyBVQ1RMIFwicmVmY2xrLXR5cGUtc3NcIlxuIik7
DQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQkJfQ0KPiAtCQlpID0gb2ZfcHJvcGVydHlfcmVh
ZF9zdHJpbmcoZGV2LT5vZl9ub2RlLA0KPiAtCQkJCQkgICAgInJlZmNsay10eXBlLWhzIiwgJmhz
X2Nsb2NrX3R5cGUpOw0KPiAtCQlpZiAoaSkgew0KPiAtCQkJZGV2X2VycihkZXYsICJObyBVQ1RM
IFwicmVmY2xrLXR5cGUtaHNcIlxuIik7DQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQkJfQ0K
PiAtCQlpZiAoc3RyY21wKCJkbG1jX3JlZl9jbGswIiwgc3NfY2xvY2tfdHlwZSkgPT0gMCkgew0K
PiAtCQkJaWYgKHN0cmNtcChoc19jbG9ja190eXBlLCAiZGxtY19yZWZfY2xrMCIpID09IDApDQo+
IC0JCQkJcmVmX2Nsa19zZWwgPSAwOw0KPiAtCQkJZWxzZSBpZiAoc3RyY21wKGhzX2Nsb2NrX3R5
cGUsICJwbGxfcmVmX2NsayIpID09IDApDQo+IC0JCQkJcmVmX2Nsa19zZWwgPSAyOw0KPiAtCQkJ
ZWxzZQ0KPiAtCQkJCWRldl93YXJuKGRldiwgIkludmFsaWQgSFMgY2xvY2sgdHlwZSAlcywgdXNp
bmcgcGxsX3JlZl9jbGsgaW5zdGVhZFxuIiwNCj4gLQkJCQkJIGhzX2Nsb2NrX3R5cGUpOw0KPiAt
CQl9IGVsc2UgaWYgKHN0cmNtcChzc19jbG9ja190eXBlLCAiZGxtY19yZWZfY2xrMSIpID09IDAp
IHsNCj4gLQkJCWlmIChzdHJjbXAoaHNfY2xvY2tfdHlwZSwgImRsbWNfcmVmX2NsazEiKSA9PSAw
KQ0KPiAtCQkJCXJlZl9jbGtfc2VsID0gMTsNCj4gLQkJCWVsc2UgaWYgKHN0cmNtcChoc19jbG9j
a190eXBlLCAicGxsX3JlZl9jbGsiKSA9PSAwKQ0KPiAtCQkJCXJlZl9jbGtfc2VsID0gMzsNCj4g
LQkJCWVsc2Ugew0KPiAtCQkJCWRldl93YXJuKGRldiwgIkludmFsaWQgSFMgY2xvY2sgdHlwZSAl
cywgdXNpbmcgcGxsX3JlZl9jbGsgaW5zdGVhZFxuIiwNCj4gLQkJCQkJIGhzX2Nsb2NrX3R5cGUp
Ow0KPiAtCQkJCXJlZl9jbGtfc2VsID0gMzsNCj4gLQkJCX0NCj4gLQkJfSBlbHNlDQo+IC0JCQlk
ZXZfd2FybihkZXYsICJJbnZhbGlkIFNTIGNsb2NrIHR5cGUgJXMsIHVzaW5nIGRsbWNfcmVmX2Ns
azAgaW5zdGVhZFxuIiwNCj4gLQkJCQkgc3NfY2xvY2tfdHlwZSk7DQo+IC0NCj4gLQkJaWYgKChy
ZWZfY2xrX3NlbCA9PSAwIHx8IHJlZl9jbGtfc2VsID09IDEpICYmDQo+IC0JCSAgICAoY2xvY2tf
cmF0ZSAhPSAxMDAwMDAwMDApKQ0KPiAtCQkJZGV2X3dhcm4oZGV2LCAiSW52YWxpZCBVQ1RMIGNs
b2NrIHJhdGUgb2YgJXUsIHVzaW5nIDEwMDAwMDAwMCBpbnN0ZWFkXG4iLA0KPiAtCQkJCSBjbG9j
a19yYXRlKTsNCj4gLQ0KPiAtCX0gZWxzZSB7DQo+IC0JCWRldl9lcnIoZGV2LCAiTm8gVVNCIFVD
VEwgZGV2aWNlIG5vZGVcbiIpOw0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQl9DQo+IC0NCj4g
IAkvKg0KPiAgCSAqIFN0ZXAgMTogV2FpdCBmb3IgYWxsIHZvbHRhZ2VzIHRvIGJlIHN0YWJsZS4u
LnRoYXQgc3VyZWx5DQo+ICAJICogICAgICAgICBoYXBwZW5lZCBiZWZvcmUgc3RhcnRpbmcgdGhl
IGtlcm5lbC4gU0tJUA0KPiBAQCAtMzk5LDI0ICszNDYsNiBAQCBzdGF0aWMgaW50IGR3YzNfb2N0
ZW9uX2Nsb2Nrc19zdGFydChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAqYmFzZSkN
Cj4gIAl2YWwgJj0gflVTQkRSRF9VQ1RMX0NUTF9SRUZfQ0xLX1NFTDsNCj4gIAl2YWwgfD0gRklF
TERfUFJFUChVU0JEUkRfVUNUTF9DVExfUkVGX0NMS19TRUwsIHJlZl9jbGtfc2VsKTsNCj4gIA0K
PiAtCXJlZl9jbGtfZnNlbCA9IDB4MDc7DQo+IC0Jc3dpdGNoIChjbG9ja19yYXRlKSB7DQo+IC0J
ZGVmYXVsdDoNCj4gLQkJZGV2X3dhcm4oZGV2LCAiSW52YWxpZCByZWZfY2xrICV1LCB1c2luZyAx
MDAwMDAwMDAgaW5zdGVhZFxuIiwNCj4gLQkJCSBjbG9ja19yYXRlKTsNCj4gLQkJZmFsbHRocm91
Z2g7DQo+IC0JY2FzZSAxMDAwMDAwMDA6DQo+IC0JCW1wbGxfbXVsID0gMHgxOTsNCj4gLQkJaWYg
KHJlZl9jbGtfc2VsIDwgMikNCj4gLQkJCXJlZl9jbGtfZnNlbCA9IDB4Mjc7DQo+IC0JCWJyZWFr
Ow0KPiAtCWNhc2UgNTAwMDAwMDA6DQo+IC0JCW1wbGxfbXVsID0gMHgzMjsNCj4gLQkJYnJlYWs7
DQo+IC0JY2FzZSAxMjUwMDAwMDA6DQo+IC0JCW1wbGxfbXVsID0gMHgyODsNCj4gLQkJYnJlYWs7
DQo+IC0JfQ0KPiAgCXZhbCAmPSB+VVNCRFJEX1VDVExfQ1RMX1JFRl9DTEtfRlNFTDsNCj4gIAl2
YWwgfD0gRklFTERfUFJFUChVU0JEUkRfVUNUTF9DVExfUkVGX0NMS19GU0VMLCByZWZfY2xrX2Zz
ZWwpOw0KPiAgDQo+IEBAIC01MDIsOCArNDI5LDcyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBkd2Mz
X29jdGVvbl9waHlfcmVzZXQodm9pZCBfX2lvbWVtICpiYXNlKQ0KPiAgc3RhdGljIGludCBkd2Mz
X29jdGVvbl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgCXN0
cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+ICsJc3RydWN0IGRldmljZV9ub2RlICpu
b2RlID0gZGV2LT5vZl9ub2RlOw0KPiAgCXN0cnVjdCBkd2MzX2RhdGEgKmRhdGE7DQo+IC0JaW50
IGVycjsNCj4gKwlpbnQgZXJyLCByZWZfY2xrX3NlbCwgcmVmX2Nsa19mc2VsLCBtcGxsX211bDsN
Cj4gKwl1aW50MzJfdCBjbG9ja19yYXRlOw0KPiArCWNvbnN0IGNoYXIgKmhzX2Nsb2NrX3R5cGUs
ICpzc19jbG9ja190eXBlOw0KPiArDQo+ICsJaWYgKCFub2RlKSB7DQo+ICsJCWRldl9lcnIoZGV2
LCAiTm8gVVNCIFVDVEwgZGV2aWNlIG5vZGVcbiIpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4g
Kwl9DQo+ICsNCj4gKwlpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgInJlZmNsay1mcmVx
dWVuY3kiLCAmY2xvY2tfcmF0ZSkpIHsNCj4gKwkJZGV2X2VycihkZXYsICJObyBVQ1RMIFwicmVm
Y2xrLWZyZXF1ZW5jeVwiXG4iKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArCWlm
IChvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhub2RlLCAicmVmY2xrLXR5cGUtc3MiLCAmc3NfY2xv
Y2tfdHlwZSkpIHsNCj4gKwkJZGV2X2VycihkZXYsICJObyBVQ1RMIFwicmVmY2xrLXR5cGUtc3Nc
IlxuIik7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gKwlpZiAob2ZfcHJvcGVydHlf
cmVhZF9zdHJpbmcobm9kZSwgInJlZmNsay10eXBlLWhzIiwgJmhzX2Nsb2NrX3R5cGUpKSB7DQo+
ICsJCWRldl9lcnIoZGV2LCAiTm8gVUNUTCBcInJlZmNsay10eXBlLWhzXCJcbiIpOw0KPiArCQly
ZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gKwlyZWZfY2xrX3NlbCA9IDI7DQoNCkNhbiB3
ZSB1c2UgbWFjcm8gaW5zdGVhZCBvZiBtYWdpYyBudW1iZXJzPw0KDQo+ICsJaWYgKHN0cmNtcCgi
ZGxtY19yZWZfY2xrMCIsIHNzX2Nsb2NrX3R5cGUpID09IDApIHsNCj4gKwkJaWYgKHN0cmNtcCho
c19jbG9ja190eXBlLCAiZGxtY19yZWZfY2xrMCIpID09IDApDQo+ICsJCQlyZWZfY2xrX3NlbCA9
IDA7DQo+ICsJCWVsc2UgaWYgKHN0cmNtcChoc19jbG9ja190eXBlLCAicGxsX3JlZl9jbGsiKSA9
PSAwKQ0KPiArCQkJcmVmX2Nsa19zZWwgPSAyOw0KPiArCQllbHNlDQo+ICsJCQlkZXZfd2Fybihk
ZXYsICJJbnZhbGlkIEhTIGNsb2NrIHR5cGUgJXMsIHVzaW5nIHBsbF9yZWZfY2xrIGluc3RlYWRc
biIsDQo+ICsJCQkJIGhzX2Nsb2NrX3R5cGUpOw0KPiArCX0gZWxzZSBpZiAoc3RyY21wKHNzX2Ns
b2NrX3R5cGUsICJkbG1jX3JlZl9jbGsxIikgPT0gMCkgew0KPiArCQlpZiAoc3RyY21wKGhzX2Ns
b2NrX3R5cGUsICJkbG1jX3JlZl9jbGsxIikgPT0gMCkNCj4gKwkJCXJlZl9jbGtfc2VsID0gMTsN
Cj4gKwkJZWxzZSBpZiAoc3RyY21wKGhzX2Nsb2NrX3R5cGUsICJwbGxfcmVmX2NsayIpID09IDAp
DQo+ICsJCQlyZWZfY2xrX3NlbCA9IDM7DQoNClBsZWFzZSBydW4gY2hlY2twYXRjaCBhbmQgZml4
IG1pbm9yIGZvcm1hdHRpbmcgaXNzdWVzIHN1Y2ggYXMgYnJhY2tldA0KaGVyZS4NCg0KPiArCQll
bHNlIHsNCj4gKwkJCWRldl93YXJuKGRldiwgIkludmFsaWQgSFMgY2xvY2sgdHlwZSAlcywgdXNp
bmcgcGxsX3JlZl9jbGsgaW5zdGVhZFxuIiwNCj4gKwkJCQkgaHNfY2xvY2tfdHlwZSk7DQo+ICsJ
CQlyZWZfY2xrX3NlbCA9IDM7DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0KPiArCQlkZXZfd2Fybihk
ZXYsICJJbnZhbGlkIFNTIGNsb2NrIHR5cGUgJXMsIHVzaW5nIGRsbWNfcmVmX2NsazAgaW5zdGVh
ZFxuIiwNCj4gKwkJCSBzc19jbG9ja190eXBlKTsNCj4gKwl9DQo+ICsNCj4gKwlyZWZfY2xrX2Zz
ZWwgPSAweDA3Ow0KPiArCXN3aXRjaCAoY2xvY2tfcmF0ZSkgew0KPiArCWRlZmF1bHQ6DQo+ICsJ
CWRldl93YXJuKGRldiwgIkludmFsaWQgcmVmX2NsayAldSwgdXNpbmcgMTAwMDAwMDAwIGluc3Rl
YWRcbiIsDQo+ICsJCQkgY2xvY2tfcmF0ZSk7DQo+ICsJCWZhbGx0aHJvdWdoOw0KPiArCWNhc2Ug
MTAwMDAwMDAwOg0KPiArCQltcGxsX211bCA9IDB4MTk7DQo+ICsJCWlmIChyZWZfY2xrX3NlbCA8
IDIpDQo+ICsJCQlyZWZfY2xrX2ZzZWwgPSAweDI3Ow0KPiArCQlicmVhazsNCj4gKwljYXNlIDUw
MDAwMDAwOg0KPiArCQltcGxsX211bCA9IDB4MzI7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgMTI1
MDAwMDAwOg0KPiArCQltcGxsX211bCA9IDB4Mjg7DQo+ICsJCWJyZWFrOw0KPiArCX0NCj4gIA0K
PiAgCWRhdGEgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmRhdGEpLCBHRlBfS0VSTkVMKTsN
Cj4gIAlpZiAoIWRhdGEpDQo+IEBAIC01MTYsNyArNTA3LDggQEAgc3RhdGljIGludCBkd2MzX29j
dGVvbl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWlmIChJU19FUlIo
ZGF0YS0+YmFzZSkpDQo+ICAJCXJldHVybiBQVFJfRVJSKGRhdGEtPmJhc2UpOw0KPiAgDQo+IC0J
ZXJyID0gZHdjM19vY3Rlb25fY2xvY2tzX3N0YXJ0KGRldiwgZGF0YS0+YmFzZSk7DQo+ICsJZXJy
ID0gZHdjM19vY3Rlb25fY2xvY2tzX3N0YXJ0KGRldiwgZGF0YS0+YmFzZSwNCj4gKwkJCQkgICAg
ICAgcmVmX2Nsa19zZWwsIHJlZl9jbGtfZnNlbCwgbXBsbF9tdWwpOw0KPiAgCWlmIChlcnIpDQo+
ICAJCXJldHVybiBlcnI7DQo+ICANCj4gLS0gDQo+IDIuMzkuMg0KPiANCg0KVGhhbmtzLA0KVGhp
bmg=
