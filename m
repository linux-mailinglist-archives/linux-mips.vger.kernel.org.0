Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46442752E57
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jul 2023 02:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbjGNAm2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Jul 2023 20:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjGNAm0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Jul 2023 20:42:26 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5FD2D51;
        Thu, 13 Jul 2023 17:42:24 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36DLDQZB026256;
        Thu, 13 Jul 2023 17:42:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=wV7LHfcxNgjvAA/YjjiPbNSJkKaMps10WyBRVrYn7jM=;
 b=uS9/SPKc8Ah4GrIL8nArtAGjoR/Qqr3KbZSW9dn8jr7GzO+8y+yvDVjYpLxeaYaxlyoK
 ma5N30eJR+98/Lk1vHy+M3mt/MiwTvDIYnuPC3I1rFu9XgHnbS2tfkQsWZPpuC32sPyq
 csY8iSNb/4zrdnLjifQARJ+E/dCf3jAmpkyUUQmE6fF4J1zW6YhqZiBjwi1eOZrRB/w2
 P9bO1FzzHjOdNOTD+ynOPYyf8aYBRN6f1nMKzJhcZNf3WiYXwaJonH3ChxlK4SBCorhA
 kLZVO1h2npErF0tbZzOSpJzKXeqrnQeCjkWlHXhv0JOd1ae/lo1PmIMm3QzIgLr/PEzK RQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3rtqja0w5r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jul 2023 17:42:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1689295331; bh=wV7LHfcxNgjvAA/YjjiPbNSJkKaMps10WyBRVrYn7jM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=TxeMVm/XkLJrga9yZux14KsoEzocQQvHyXpaqV70Z0vtS9q3HkKljG+sOXs257WE6
         bcVdI8GJGRpAU1J4BXP9yPPx4iHn7oMRiom3/bjv51zx+eWG4Lp5SYEYvBdUbz+/C4
         MC63N294+U37t3bUdzkXVmMJpWa51SrKrX3DR8bI5okpy9moVuArHQhoEVkCZRFTSg
         ckRVI+hKrR4Pzen5qpFgiajtnSKuuWn6AxYSk74Z7unUfPsC7xQNDDxaYe3TZCz0v8
         xAUhpaK031iZg2ZFEI/mAUR1tecibtnowXJD8VV07qTh9SYV+D9AwaUyL0MiJGQGYT
         Xj0SP/L2G4lbA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3B1D74013F;
        Fri, 14 Jul 2023 00:42:11 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3B7D5A0244;
        Fri, 14 Jul 2023 00:42:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Sc+2TZQc;
        dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 436C4404D0;
        Fri, 14 Jul 2023 00:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YS8+uQOOvExatfWGg4tko+rEIXK9Bk1AMm6TEpJTH6C3/dk21w0jp2xS/l8Ok0wuohhKVeGTyH+rmnf2zgbtmKc4o1blRsYadE1VeKQ0YF6NUdiOxJs1P+GWmp24MCtc/mUDPqh5ZMIiFbwBbpXglUjYRJXy3FCi8uNRsI9/Hsk5zG7c+rFmoeMNf0TsE9IGGY4ZQZbHjc1L9NoSK5KK/3bDw6D7Flh6ZknP8CDD+wm6xNX89JCXmEVAhta9/ACeZkCD6JdMpx3RefWY5u5vboQu7xAvzOo5bgVzEUyrdnXQJO19QL/AJVaYlG6zJ0krIV+REEfiSq63Brirjplrbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wV7LHfcxNgjvAA/YjjiPbNSJkKaMps10WyBRVrYn7jM=;
 b=mhdJ8tXFGUAenJRvr/YKYAb1T817lYsE7ujeYzMnyZpWn0vMGRxuxSrmscjuzl+TK6Z1gWa92uxs88qp136MuTgTWFe8FZTy01Gx1+R1T066wr27WOpXnuLMyDtRC2Fv4d9fD2KDW3+TGE981WVG69juDOtFo1baijd+BIphneCVTStmDW3OfUTO6mNyh6eMSnNE1Hga8AF2NP2SizC4AU2tUp8Yq8sF4O+fzvEB6s5kOQRdIXtttwUUn40VpkXjR8DpU1JLfs4X8DwGjV8AEODSsNzDawuxPdJ+cASe+AuZtbtfl/98BKcENY0A8Z4pSOY32vfkkrgXSsbzGfNGvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wV7LHfcxNgjvAA/YjjiPbNSJkKaMps10WyBRVrYn7jM=;
 b=Sc+2TZQc2+nj3pWuGBdWfJDmJTbdXlcI5QP9uiXadksc01ezcIZv3dko3Lct4Mbxn+MPdS+kcuQUqEiqinCP7oGorvIaMqZLk202QjdiIK3dSGe/gwOw+fUCoFO4RPRqPL4qbTuHmMwEVf1Y4mQXaOYS4UgpQRB4/kqtemx+0Uw=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH3PR12MB8851.namprd12.prod.outlook.com (2603:10b6:610:180::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.26; Fri, 14 Jul
 2023 00:42:02 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::adba:1075:fd90:fe1d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::adba:1075:fd90:fe1d%3]) with mapi id 15.20.6588.024; Fri, 14 Jul 2023
 00:42:02 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] usb: dwc3: dwc3-octeon: Move node parsing into
 driver probe
Thread-Topic: [PATCH v2 2/3] usb: dwc3: dwc3-octeon: Move node parsing into
 driver probe
Thread-Index: AQHZrHqISVNAK1oWA0KLciAtaDdRD6+r0kCAgAx5QwCAADODAA==
Date:   Fri, 14 Jul 2023 00:42:02 +0000
Message-ID: <20230714004156.gszzrrfpljalyrmf@synopsys.com>
References: <ZKDBiY6TKdDKIFK+@lenoch> <ZKDB+d49HVfoZDdd@lenoch>
 <20230705230827.ckzaryaaz73sjrqb@synopsys.com> <ZLBunhzPaRsFlg41@lenoch>
In-Reply-To: <ZLBunhzPaRsFlg41@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH3PR12MB8851:EE_
x-ms-office365-filtering-correlation-id: 854115c5-60f3-4d2a-c7d6-08db840323cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /96GFJSX5OT4EQkQEEfVWUUJJtVjYFcdP9NjeCzjvDkRFB0hT3gdwW4fk39aMU9IYVzNc/IHcUqzutyTtwfF/5tYp3P7vHZKMsqmDdlnBIv3i9teckzz9uJED7auSOQLqUeqwC838fX/7oHw4GKhdNAptcq5WDsB1vwjb364enZ1L0oihkRaJSsebnYbfDR59N1Sm1SmjFWqMTvh//e1F87xPDf2njnGXMos6RhKt5YQm2oBqk0Ghx6uGHzawl+CNngmP2v4fLOHogAts5HL7WaxFonOFgfl47KLsKShoBWKmC/qOuZSloZnq2+RyYf/vppo5K0NQS4sUfBOyG0TpJvj48SZy5E5U35ZQJcGUoN4NrP8nmyWb8RlJfS94uuFCSnjhJYouiPTcZ/ewaDldpmnqvn1kxPv+r3Je8QVaceoMSZPKGR7eQtjwg/gEEQ1N3utoc6dcwge/hkViRQVURLzN0hPNxE0pub5BSvnWry7XX4jbW2OwXE0eQxxjiEHaP7a1MUzlAzHp18rHg21vVKh1rgsN+vVVATTLq6fcmnQD3gkRB3r0bDpkdkK+uebxp2pGNTSr0Gf/ljkwf9dXb1gON0LjzC0mpX81TL/RO64nUjdXnKfLzha83g0Msfb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199021)(8936002)(8676002)(41300700001)(38070700005)(2616005)(2906002)(316002)(3716004)(71200400001)(4326008)(6486002)(66476007)(66946007)(54906003)(66556008)(76116006)(64756008)(66446008)(6916009)(478600001)(6512007)(38100700002)(5660300002)(1076003)(186003)(86362001)(83380400001)(26005)(122000001)(6506007)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dE8rcmtwdGJTTG1qOTdjSEJNUlFORXUzRDdUZ2VlS05Ia1RIUzhERnhkL2du?=
 =?utf-8?B?a0JZY1ZSRDBMdk02b05wbkRYTVk3SmFFTUFRd1g4MmNvNHNSVEVsTDVzcGFa?=
 =?utf-8?B?Q2U3Sjd0NHQwckkzTkVONXQ5aHBuQlJjbERwWGhRUVhPRU5kdHFwd2dWRUtj?=
 =?utf-8?B?SUxWV2o5aC9GQm40aGlMbmNmZ0IzdFF2ZjdSVGRUQUR5NmRhTUJINVVORW1I?=
 =?utf-8?B?N2w1aTlXdTRTRTYxNjhMVkM1ZFUwR3hxK09pQXRRRmtVZnRBUVB5U1lHTkhN?=
 =?utf-8?B?WUpGWFRwL1Z1aFpQNDhiZ0cvMjVSenhSSG5wMDdTU01Sa0w2dGZHenBqUERL?=
 =?utf-8?B?UjIvSU5mMFRwTFRUamc3am1YaTRqRUd0dmxyRnF1SktIZk93ZXJ4cjBsZjRo?=
 =?utf-8?B?akFBa05CZFVQRXJna2ZibVlOZXVTY0hyTWNZTDQ0ckd3ZHBSaWNBSDZzYS80?=
 =?utf-8?B?cFBLUHdBRnBvQ2xKbXVsK00yNEdQbG9jR2NJaUhWVFRHaW1jVnl4UGduZmFW?=
 =?utf-8?B?WnlzVlJSYitBdWNXY1ZOcVVlaG9xZVNicyt2ZGdDclMyYlZYMEVDTnVWa3lB?=
 =?utf-8?B?WlB6U2UzSmpqSDVENi9NUnllTlRrdDVQMldQVEw2QnFDUFdxYzJ1QXVTbkE1?=
 =?utf-8?B?dGU4dUV0SEo2eXJhTTg1aEowc3U4OEY5QVZEUjlpYUNxWnZKY3NBVFpaNVlj?=
 =?utf-8?B?Z1graUh6TE8yYTlpcktEYndkR2dDbzBpOXBEZHByS2NvVDI4cVdVZVBIQS8w?=
 =?utf-8?B?U2pWL05oUmRxckNReTRZdXV0YUxvZk9hWS8xU3A2VjhlWUFnZmQzbldkWmhi?=
 =?utf-8?B?K3RCMjFSRGk0QitSQ2ZqUmpLbm1IdUtXYXR3d1RqRUE3VjRHTXpDcUhmRS8z?=
 =?utf-8?B?WWg1VnZEcGJxZFpoTGJqUlFsYnVYL3FjNm5kSXJsTVVkM2hrUzhNSmxiNkJO?=
 =?utf-8?B?T0pIVndaU1ZxVjZaamhwSFlaRkJJT0xpbXIvR1o1YVNkNkhRbUdHLzNPcXVJ?=
 =?utf-8?B?ZDZMQXFBRk4xeDBwOHd0cnRkd3NuQ0lvaVFteUZUeE83ckE2ZXFJb25FZk0r?=
 =?utf-8?B?WW42T2xmVU1OTENNekVBaUhScXlVSmVQMEtHK1JlZzlZVlM3dGloK1A4dVRx?=
 =?utf-8?B?QXJBTk50eTI1MThray9HdW9tcyswWUdsWW1EYUJBRFR1ZUl1SWZMcE1MejFO?=
 =?utf-8?B?NmdhdjlSNjJkMVVxVlhrNjZRendOSEVmbjhJdER5U2E2alZEcWJ4dnczY2kr?=
 =?utf-8?B?TnBROEtXbGxVTzJBSmZ2NjV5U1lCNmFLek15Ni94L2tNMkVrSGh3N1B0T2RJ?=
 =?utf-8?B?QkZ4bFVQUTRSZ1JKZGxKOTd4S0xMd2owZkdmVENKU2hqV09UamxsdmhTV3JW?=
 =?utf-8?B?T0FJdXFPYmRVajRZelpna0d5TXBPWjVCaDc5eTNQSHA1L01HRnl4Ym1pczdF?=
 =?utf-8?B?YTg1cnBqMDhKRDJzY09CVURDTEQydzBNampYYThYV0FxWkRJdThIUWpwUmJX?=
 =?utf-8?B?SVRBVVhPM0xpKzVPZUdGc1lJYzM5b2JabEQyTFFoQ0lFcVdEMFl2QW9ZeFZH?=
 =?utf-8?B?d2srZU9PbG1JMXdWTHpkbUlYaTMzSE1nS2lCcE44Ymp5R0QyQkNmMWx1enFs?=
 =?utf-8?B?K1dtVmRvZ0YwZEkvZmovYitMWnlXaHEzd0l1ZXhieGw4ZUdFV3ltWnJNN3A0?=
 =?utf-8?B?T3Z0dHdkajI3NnZiL1U0TS9aMTkvdnVqMmZFRmtScFlrVjdKWTVpZGw0QXJz?=
 =?utf-8?B?TUEvblV6QjVCc29tcVJhemZyU29TZ3NTMDJyYmpOcS82aHExSU9uMDFFTVhQ?=
 =?utf-8?B?YWluekd0VlFrRFhWeG5HeTJLOWxXNGE5VDYwWlJEZ3lzUHd5ekRmbUNEdTFv?=
 =?utf-8?B?SXFRa3RhSWZkVkpCLzdyWWZYOFQ3R282a1RuWm4xQ2lKbHppWlJDM0hhZWxG?=
 =?utf-8?B?aTNWT3NmRzdpQjNMRHlIaWt6NG5BZ1F0cGFSUXBBdXE5SjdrdTV4bTR2elZq?=
 =?utf-8?B?cUoyaFVna3JTVWFndkwzcXNGY1ByTVRrVlVveWtLeWcvb1VUdlIzU2QwaEI2?=
 =?utf-8?B?SnJEc1hoNzFuNTZIVjh3ZXNzYXZXelZDMHFURUc3UWllTUdIUGgvNE9IM2dE?=
 =?utf-8?B?NzhKdk1mbkFlektTVnBSZDQvSGdkSGFnWUNoSXdqY1BPZUtnYzc3b0l2aVln?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0243FA491150FA47B185DB131C446903@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?aUFUYmord0hNTVN4NFg1d1pPNXljN2U5ZzBlcVZmdHFOeC9GVjVxczR1dXZU?=
 =?utf-8?B?b1VOM29tZzMwS0lhMFEzTlJyclkya0ttWlc1cmd4dFRxMGlFUDk5cVNrRnJ0?=
 =?utf-8?B?QkhPN3RnbzJGTml2WmN5ZG5GWHRTblNKdzNUYlNDRnV1ZUpKL0NES2ZCU055?=
 =?utf-8?B?d2VFRW1kN1pueUo5TjlhSFcvT0xqOEJQYVQ2ZThGd2xobG93TXJ4d0swTUZt?=
 =?utf-8?B?VE5wQTJCV0dNNHZMREdvVlpFTGRqdjhTSVJJN0YraHJpZHZSRnovakFmbEdv?=
 =?utf-8?B?dkVQZXRwTzUwcjlqZDNDM29nTkduaVI5RkdSRXgrcjBWQ0EwQTZzcVc0QWwr?=
 =?utf-8?B?VHV1MWYwMTlKV0NyV29URm5XSGhLT2J2Ull2RlcweXkzWVlKdHUwMS83ZWcx?=
 =?utf-8?B?aHlsS1d5T0FNNDlkTEFPMnVSa3JmWDRGdHV1WDhNeVdWWUU5VEc2ZUVST0lO?=
 =?utf-8?B?TUdIZ2VFbzlSZEE3ZTRENGNuREtTTnVrQ3grZTA1R3czL004R1JRZlBVZHBo?=
 =?utf-8?B?dFo0aGJNZTlZREVWTFQ4MXBWWG9GVnBWbUpZbFZ5aDVFVThxckI2YVRydThk?=
 =?utf-8?B?Z1k3RnVCd2lra2U3YjFlSjlXRVRrVEJ2ay9nMGRFSDhodCswNStNY0VXQW1o?=
 =?utf-8?B?ZVp5N1crSVBEUjVTS2Q4L2pvbXA2QXZGVkJneCtGSHRwTVlvVUdneEx3cHhk?=
 =?utf-8?B?V1VxeWcrRFVyemNJSm1YN0ZTb0gxMk13ek1HL0JpbnczaEhld3NwRVpyWGh4?=
 =?utf-8?B?eFcralNjNFdBUFFjaGRoT281V3RpMEhrVkYyc3dMVHovcjRGaGljVmZ0QW1l?=
 =?utf-8?B?cTljVFlwWTJzY2xpUXpEOG5TdThpRUN3MVF4YVIwQnR0MHpIR2pScGZJQWgx?=
 =?utf-8?B?bWh0VngzSEk4K3RkRUhTWDJzdGViQWkyT0tHWGRySDNqWmlUUmhVdTlOc2xH?=
 =?utf-8?B?eUdYbW9jd1JqRS9neTh2bFY3MmtkOGpJVklKZ2VDNkx5SVlncTRPMkR2VlBu?=
 =?utf-8?B?bUdFeXpwS2JUK1lWOWdpWitqa3daQ01YYlVvTkNtZzlCL2tZb3ViZU5aU2NR?=
 =?utf-8?B?Ri83S3pEMGpObDgzNW5TVldmTHp5RjlCdHJLd09jeFBVKzlBdE9FRFdJYUdl?=
 =?utf-8?B?em1qNWpuTE9iMnVEN2NacEhvU2RseGtnMjNJYzdkaEdCNURWTmNUQ3JqNEdZ?=
 =?utf-8?B?N3l0Z3UrWDNJR2Mwem9CNGpKS1BGS0ZqUngzS3EvdUJKa0hFZEZhYnlUMy9U?=
 =?utf-8?B?a0JQcVFSY3A2eXEvQUw0YnZSRWUwSzBRM3ltNDFBcVRqMnJPQT09?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854115c5-60f3-4d2a-c7d6-08db840323cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 00:42:02.3315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GGITIYldFTguL1CFoooU01H0sYDi5DdQvGJd3Lhu4cx1xoaTjrZCnCcFLPjBVAEaV3I9tw6mDTBksn9SNu8IxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8851
X-Proofpoint-ORIG-GUID: qvtUioEaMSdlo0bDjUfG7FI-Sdi_rOvX
X-Proofpoint-GUID: qvtUioEaMSdlo0bDjUfG7FI-Sdi_rOvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_12,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307140003
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gVGh1LCBKdWwgMTMsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBPbiBXZWQsIEp1
bCAwNSwgMjAyMyBhdCAxMTowODozMVBNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4g
T24gU3VuLCBKdWwgMDIsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiA+ID4gRnJvbTog
TGFkaXNsYXYgTWljaGwgPGxhZGlzQGxpbnV4LW1pcHMub3JnPg0KPiA+ID4gDQo+ID4gPiBNYWtl
IGR3YzNfb2N0ZW9uX2Nsb2Nrc19zdGFydCBqdXN0IHN0YXJ0IHRoZSBjbG9ja3MuDQo+ID4gDQo+
ID4gVGhpcyBjb21taXQgbWVzc2FnZSBpcyBkaWZmZXJlbnQgdGhhbiB0aGUgc3ViamVjdC4gQWxz
bywgcGxlYXNlIGV4cGxhaW4NCj4gPiB3aHkgd2UgbmVlZCB0byBtb3ZlIHRoaXMgbG9naWMgdG8g
cHJvYmUgaW4gdGhpcyBjb21taXQgbWVzc2FnZSBib2R5Lg0KPiA+IA0KPiA+ID4gDQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBMYWRpc2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+ID4g
PiAtLS0NCj4gPiA+ICBDSEFOR0VTOg0KPiA+ID4gIC12MjogaWYgZWxzZSBibG9jayBicmFja2V0
IGFjY29yZGluZyBDb2RpbmdTdHlsZQ0KPiA+ID4gIA0KPiA+ID4gIGRyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1vY3Rlb24uYyB8IDE0OCArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4g
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKSwgNzcgZGVsZXRpb25zKC0pDQo+
ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMg
Yi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4gPiA+IGluZGV4IDhkNWZhY2Q4ODFj
MS4uNjY4ZjZkMzQ5MGIxIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2Mz
LW9jdGVvbi5jDQo+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4g
PiA+IEBAIC0zMDAsNjcgKzMwMCwxNCBAQCBzdGF0aWMgaW50IGR3YzNfb2N0ZW9uX2NvbmZpZ19w
b3dlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAqYmFzZSkNCj4gPiA+ICAJcmV0
dXJuIDA7DQo+ID4gPiAgfQ0KPiA+ID4gIA0KPiA+ID4gLXN0YXRpYyBpbnQgZHdjM19vY3Rlb25f
Y2xvY2tzX3N0YXJ0KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCBfX2lvbWVtICpiYXNlKQ0KPiA+
ID4gK3N0YXRpYyBpbnQgZHdjM19vY3Rlb25fY2xvY2tzX3N0YXJ0KHN0cnVjdCBkZXZpY2UgKmRl
diwgdm9pZCBfX2lvbWVtICpiYXNlLA0KPiA+ID4gKwkJCQkgICAgaW50IHJlZl9jbGtfc2VsLCBp
bnQgcmVmX2Nsa19mc2VsLA0KPiA+ID4gKwkJCQkgICAgaW50IG1wbGxfbXVsKQ0KPiA+ID4gIHsN
Cj4gPiA+IC0JaW50IGksIGRpdiwgbXBsbF9tdWwsIHJlZl9jbGtfZnNlbCwgcmVmX2Nsa19zZWwg
PSAyOw0KPiA+ID4gLQl1MzIgY2xvY2tfcmF0ZTsNCj4gPiA+ICsJaW50IGRpdjsNCj4gPiA+ICAJ
dTY0IHZhbDsNCj4gPiA+ICAJdm9pZCBfX2lvbWVtICp1Y3RsX2N0bF9yZWcgPSBiYXNlICsgVVNC
RFJEX1VDVExfQ1RMOw0KPiA+ID4gIA0KPiA+ID4gLQlpZiAoZGV2LT5vZl9ub2RlKSB7DQo+ID4g
PiAtCQljb25zdCBjaGFyICpzc19jbG9ja190eXBlOw0KPiA+ID4gLQkJY29uc3QgY2hhciAqaHNf
Y2xvY2tfdHlwZTsNCj4gPiA+IC0NCj4gPiA+IC0JCWkgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihk
ZXYtPm9mX25vZGUsDQo+ID4gPiAtCQkJCQkgInJlZmNsay1mcmVxdWVuY3kiLCAmY2xvY2tfcmF0
ZSk7DQo+ID4gPiAtCQlpZiAoaSkgew0KPiA+ID4gLQkJCWRldl9lcnIoZGV2LCAiTm8gVUNUTCBc
InJlZmNsay1mcmVxdWVuY3lcIlxuIik7DQo+ID4gPiAtCQkJcmV0dXJuIC1FSU5WQUw7DQo+ID4g
PiAtCQl9DQo+ID4gPiAtCQlpID0gb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcoZGV2LT5vZl9ub2Rl
LA0KPiA+ID4gLQkJCQkJICAgICJyZWZjbGstdHlwZS1zcyIsICZzc19jbG9ja190eXBlKTsNCj4g
PiA+IC0JCWlmIChpKSB7DQo+ID4gPiAtCQkJZGV2X2VycihkZXYsICJObyBVQ1RMIFwicmVmY2xr
LXR5cGUtc3NcIlxuIik7DQo+ID4gPiAtCQkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiAtCQl9DQo+
ID4gPiAtCQlpID0gb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcoZGV2LT5vZl9ub2RlLA0KPiA+ID4g
LQkJCQkJICAgICJyZWZjbGstdHlwZS1ocyIsICZoc19jbG9ja190eXBlKTsNCj4gPiA+IC0JCWlm
IChpKSB7DQo+ID4gPiAtCQkJZGV2X2VycihkZXYsICJObyBVQ1RMIFwicmVmY2xrLXR5cGUtaHNc
IlxuIik7DQo+ID4gPiAtCQkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiAtCQl9DQo+ID4gPiAtCQlp
ZiAoc3RyY21wKCJkbG1jX3JlZl9jbGswIiwgc3NfY2xvY2tfdHlwZSkgPT0gMCkgew0KPiA+ID4g
LQkJCWlmIChzdHJjbXAoaHNfY2xvY2tfdHlwZSwgImRsbWNfcmVmX2NsazAiKSA9PSAwKQ0KPiA+
ID4gLQkJCQlyZWZfY2xrX3NlbCA9IDA7DQo+ID4gPiAtCQkJZWxzZSBpZiAoc3RyY21wKGhzX2Ns
b2NrX3R5cGUsICJwbGxfcmVmX2NsayIpID09IDApDQo+ID4gPiAtCQkJCXJlZl9jbGtfc2VsID0g
MjsNCj4gPiA+IC0JCQllbHNlDQo+ID4gPiAtCQkJCWRldl93YXJuKGRldiwgIkludmFsaWQgSFMg
Y2xvY2sgdHlwZSAlcywgdXNpbmcgcGxsX3JlZl9jbGsgaW5zdGVhZFxuIiwNCj4gPiA+IC0JCQkJ
CSBoc19jbG9ja190eXBlKTsNCj4gPiA+IC0JCX0gZWxzZSBpZiAoc3RyY21wKHNzX2Nsb2NrX3R5
cGUsICJkbG1jX3JlZl9jbGsxIikgPT0gMCkgew0KPiA+ID4gLQkJCWlmIChzdHJjbXAoaHNfY2xv
Y2tfdHlwZSwgImRsbWNfcmVmX2NsazEiKSA9PSAwKQ0KPiA+ID4gLQkJCQlyZWZfY2xrX3NlbCA9
IDE7DQo+ID4gPiAtCQkJZWxzZSBpZiAoc3RyY21wKGhzX2Nsb2NrX3R5cGUsICJwbGxfcmVmX2Ns
ayIpID09IDApDQo+ID4gPiAtCQkJCXJlZl9jbGtfc2VsID0gMzsNCj4gPiA+IC0JCQllbHNlIHsN
Cj4gPiA+IC0JCQkJZGV2X3dhcm4oZGV2LCAiSW52YWxpZCBIUyBjbG9jayB0eXBlICVzLCB1c2lu
ZyBwbGxfcmVmX2NsayBpbnN0ZWFkXG4iLA0KPiA+ID4gLQkJCQkJIGhzX2Nsb2NrX3R5cGUpOw0K
PiA+ID4gLQkJCQlyZWZfY2xrX3NlbCA9IDM7DQo+ID4gPiAtCQkJfQ0KPiA+ID4gLQkJfSBlbHNl
DQo+ID4gPiAtCQkJZGV2X3dhcm4oZGV2LCAiSW52YWxpZCBTUyBjbG9jayB0eXBlICVzLCB1c2lu
ZyBkbG1jX3JlZl9jbGswIGluc3RlYWRcbiIsDQo+ID4gPiAtCQkJCSBzc19jbG9ja190eXBlKTsN
Cj4gPiA+IC0NCj4gPiA+IC0JCWlmICgocmVmX2Nsa19zZWwgPT0gMCB8fCByZWZfY2xrX3NlbCA9
PSAxKSAmJg0KPiA+ID4gLQkJICAgIChjbG9ja19yYXRlICE9IDEwMDAwMDAwMCkpDQo+ID4gPiAt
CQkJZGV2X3dhcm4oZGV2LCAiSW52YWxpZCBVQ1RMIGNsb2NrIHJhdGUgb2YgJXUsIHVzaW5nIDEw
MDAwMDAwMCBpbnN0ZWFkXG4iLA0KPiA+ID4gLQkJCQkgY2xvY2tfcmF0ZSk7DQo+ID4gPiAtDQo+
ID4gPiAtCX0gZWxzZSB7DQo+ID4gPiAtCQlkZXZfZXJyKGRldiwgIk5vIFVTQiBVQ1RMIGRldmlj
ZSBub2RlXG4iKTsNCj4gPiA+IC0JCXJldHVybiAtRUlOVkFMOw0KPiA+ID4gLQl9DQo+ID4gPiAt
DQo+ID4gPiAgCS8qDQo+ID4gPiAgCSAqIFN0ZXAgMTogV2FpdCBmb3IgYWxsIHZvbHRhZ2VzIHRv
IGJlIHN0YWJsZS4uLnRoYXQgc3VyZWx5DQo+ID4gPiAgCSAqICAgICAgICAgaGFwcGVuZWQgYmVm
b3JlIHN0YXJ0aW5nIHRoZSBrZXJuZWwuIFNLSVANCj4gPiA+IEBAIC00MDQsMjQgKzM1MSw2IEBA
IHN0YXRpYyBpbnQgZHdjM19vY3Rlb25fY2xvY2tzX3N0YXJ0KHN0cnVjdCBkZXZpY2UgKmRldiwg
dm9pZCBfX2lvbWVtICpiYXNlKQ0KPiA+ID4gIAl2YWwgJj0gflVTQkRSRF9VQ1RMX0NUTF9SRUZf
Q0xLX1NFTDsNCj4gPiA+ICAJdmFsIHw9IEZJRUxEX1BSRVAoVVNCRFJEX1VDVExfQ1RMX1JFRl9D
TEtfU0VMLCByZWZfY2xrX3NlbCk7DQo+ID4gPiAgDQo+ID4gPiAtCXJlZl9jbGtfZnNlbCA9IDB4
MDc7DQo+ID4gPiAtCXN3aXRjaCAoY2xvY2tfcmF0ZSkgew0KPiA+ID4gLQlkZWZhdWx0Og0KPiA+
ID4gLQkJZGV2X3dhcm4oZGV2LCAiSW52YWxpZCByZWZfY2xrICV1LCB1c2luZyAxMDAwMDAwMDAg
aW5zdGVhZFxuIiwNCj4gPiA+IC0JCQkgY2xvY2tfcmF0ZSk7DQo+ID4gPiAtCQlmYWxsdGhyb3Vn
aDsNCj4gPiA+IC0JY2FzZSAxMDAwMDAwMDA6DQo+ID4gPiAtCQltcGxsX211bCA9IDB4MTk7DQo+
ID4gPiAtCQlpZiAocmVmX2Nsa19zZWwgPCAyKQ0KPiA+ID4gLQkJCXJlZl9jbGtfZnNlbCA9IDB4
Mjc7DQo+ID4gPiAtCQlicmVhazsNCj4gPiA+IC0JY2FzZSA1MDAwMDAwMDoNCj4gPiA+IC0JCW1w
bGxfbXVsID0gMHgzMjsNCj4gPiA+IC0JCWJyZWFrOw0KPiA+ID4gLQljYXNlIDEyNTAwMDAwMDoN
Cj4gPiA+IC0JCW1wbGxfbXVsID0gMHgyODsNCj4gPiA+IC0JCWJyZWFrOw0KPiA+ID4gLQl9DQo+
ID4gPiAgCXZhbCAmPSB+VVNCRFJEX1VDVExfQ1RMX1JFRl9DTEtfRlNFTDsNCj4gPiA+ICAJdmFs
IHw9IEZJRUxEX1BSRVAoVVNCRFJEX1VDVExfQ1RMX1JFRl9DTEtfRlNFTCwgcmVmX2Nsa19mc2Vs
KTsNCj4gPiA+ICANCj4gPiA+IEBAIC01MDUsOCArNDM0LDcyIEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBkd2MzX29jdGVvbl9waHlfcmVzZXQodm9pZCBfX2lvbWVtICpiYXNlKQ0KPiA+ID4gIHN0YXRp
YyBpbnQgZHdjM19vY3Rlb25fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
PiA+ICB7DQo+ID4gPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+ID4gPiAr
CXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IGRldi0+b2Zfbm9kZTsNCj4gPiA+ICAJc3RydWN0
IGR3YzNfZGF0YSAqZGF0YTsNCj4gPiA+IC0JaW50IGVycjsNCj4gPiA+ICsJaW50IGVyciwgcmVm
X2Nsa19zZWwsIHJlZl9jbGtfZnNlbCwgbXBsbF9tdWw7DQo+ID4gPiArCXVpbnQzMl90IGNsb2Nr
X3JhdGU7DQo+ID4gDQo+ID4gVXNlIHUzMj8NCj4gDQo+IEkgZG8gbm90IGxpa2UgaG9tZWJyZXcg
dHlwZXMgd2hlbiB3ZSBoYXZlIHN0YW5kYXJkIG9uZXMuIEJ1dCBpdCBzZWVtcyBhbG1vc3QNCj4g
YWxsIHVzYiBjb2RlIGlzIHVzaW5nIHUzMiwgc28gSSBjYW4gbGl2ZSB3aXRoIHRoYXQuDQo+IA0K
PiA+ID4gKwljb25zdCBjaGFyICpoc19jbG9ja190eXBlLCAqc3NfY2xvY2tfdHlwZTsNCj4gPiA+
ICsNCj4gPiA+ICsJaWYgKCFub2RlKSB7DQo+ID4gPiArCQlkZXZfZXJyKGRldiwgIk5vIFVTQiBV
Q1RMIGRldmljZSBub2RlXG4iKTsNCj4gPiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ID4gKwl9
DQo+ID4gPiArDQo+ID4gPiArCWlmIChvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAicmVmY2xr
LWZyZXF1ZW5jeSIsICZjbG9ja19yYXRlKSkgew0KPiA+ID4gKwkJZGV2X2VycihkZXYsICJObyBV
Q1RMIFwicmVmY2xrLWZyZXF1ZW5jeVwiXG4iKTsNCj4gPiA+ICsJCXJldHVybiAtRUlOVkFMOw0K
PiA+ID4gKwl9DQo+ID4gPiArCWlmIChvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhub2RlLCAicmVm
Y2xrLXR5cGUtc3MiLCAmc3NfY2xvY2tfdHlwZSkpIHsNCj4gPiA+ICsJCWRldl9lcnIoZGV2LCAi
Tm8gVUNUTCBcInJlZmNsay10eXBlLXNzXCJcbiIpOw0KPiA+ID4gKwkJcmV0dXJuIC1FSU5WQUw7
DQo+ID4gPiArCX0NCj4gPiA+ICsJaWYgKG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nKG5vZGUsICJy
ZWZjbGstdHlwZS1ocyIsICZoc19jbG9ja190eXBlKSkgew0KPiA+ID4gKwkJZGV2X2VycihkZXYs
ICJObyBVQ1RMIFwicmVmY2xrLXR5cGUtaHNcIlxuIik7DQo+ID4gPiArCQlyZXR1cm4gLUVJTlZB
TDsNCj4gPiA+ICsJfQ0KPiA+ID4gKw0KPiA+ID4gKwlyZWZfY2xrX3NlbCA9IDI7DQo+ID4gPiAr
CWlmIChzdHJjbXAoImRsbWNfcmVmX2NsazAiLCBzc19jbG9ja190eXBlKSA9PSAwKSB7DQo+ID4g
PiArCQlpZiAoc3RyY21wKGhzX2Nsb2NrX3R5cGUsICJkbG1jX3JlZl9jbGswIikgPT0gMCkNCj4g
PiA+ICsJCQlyZWZfY2xrX3NlbCA9IDA7DQo+ID4gPiArCQllbHNlIGlmIChzdHJjbXAoaHNfY2xv
Y2tfdHlwZSwgInBsbF9yZWZfY2xrIikgPT0gMCkNCj4gPiA+ICsJCQlyZWZfY2xrX3NlbCA9IDI7
DQo+ID4gPiArCQllbHNlDQo+ID4gPiArCQkJZGV2X3dhcm4oZGV2LCAiSW52YWxpZCBIUyBjbG9j
ayB0eXBlICVzLCB1c2luZyBwbGxfcmVmX2NsayBpbnN0ZWFkXG4iLA0KPiA+ID4gKwkJCQkgaHNf
Y2xvY2tfdHlwZSk7DQo+ID4gPiArCX0gZWxzZSBpZiAoc3RyY21wKHNzX2Nsb2NrX3R5cGUsICJk
bG1jX3JlZl9jbGsxIikgPT0gMCkgew0KPiA+IA0KPiA+IERpZCB5b3UgcnVuIGNoZWNrcGF0Y2g/
IEkgc3RpbGwgc2VlIHNvbWUgbWlub3IgZm9ybWF0dGluZyBpc3N1ZXMuDQo+IA0KPiBZZXMgSSBk
aWQuIFdoYXQgY29tcGxhaW4gZG8geW91IHNlZSBmcm9tIGNoZWNrcGF0Y2g/DQoNCmNoZWNrcGF0
Y2gucGwgLS1zdHJpY3QNCg0KQ0hFQ0s6IFByZWZlciBrZXJuZWwgdHlwZSAndTMyJyBvdmVyICd1
aW50MzJfdCcNCiMxMzQ6IEZJTEU6IGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYzo0NDA6
DQorCXVpbnQzMl90IGNsb2NrX3JhdGU7DQoNCkNIRUNLOiBicmFjZXMge30gc2hvdWxkIGJlIHVz
ZWQgb24gYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQNCiMxNjU6IEZJTEU6IGRyaXZlcnMvdXNi
L2R3YzMvZHdjMy1vY3Rlb24uYzo0NzE6DQorCQlpZiAoc3RyY21wKGhzX2Nsb2NrX3R5cGUsICJk
bG1jX3JlZl9jbGsxIikgPT0gMCkNClsuLi5dDQorCQllbHNlIGlmIChzdHJjbXAoaHNfY2xvY2tf
dHlwZSwgInBsbF9yZWZfY2xrIikgPT0gMCkgew0KWy4uLl0NCisJCX0gZWxzZSB7DQpbLi4uXQ0K
DQoNCkl0IHNob3VsZCBiZSB0aGUgc2FtZSBtaXNzaW5nIGJyYWNrZXQgZml4IHRoYXQgeW91IGRp
ZCBmb3IgdGhlIHNlY29uZA0KaWYsIGJ1dCBmb3IgdGhlIGZpcnN0IGlmIHN0YXRlbWVudC4NCg0K
PiANCj4gPiA+ICsJCWlmIChzdHJjbXAoaHNfY2xvY2tfdHlwZSwgImRsbWNfcmVmX2NsazEiKSA9
PSAwKQ0KPiA+ID4gKwkJCXJlZl9jbGtfc2VsID0gMTsNCj4gPiA+ICsJCWVsc2UgaWYgKHN0cmNt
cChoc19jbG9ja190eXBlLCAicGxsX3JlZl9jbGsiKSA9PSAwKSB7DQo+ID4gPiArCQkJcmVmX2Ns
a19zZWwgPSAzOw0KPiA+ID4gKwkJfSBlbHNlIHsNCj4gPiA+ICsJCQlkZXZfd2FybihkZXYsICJJ
bnZhbGlkIEhTIGNsb2NrIHR5cGUgJXMsIHVzaW5nIHBsbF9yZWZfY2xrIGluc3RlYWRcbiIsDQo+
ID4gPiArCQkJCSBoc19jbG9ja190eXBlKTsNCj4gPiA+ICsJCQlyZWZfY2xrX3NlbCA9IDM7DQo+
ID4gPiArCQl9DQo+ID4gPiArCX0gZWxzZSB7DQo+ID4gPiArCQlkZXZfd2FybihkZXYsICJJbnZh
bGlkIFNTIGNsb2NrIHR5cGUgJXMsIHVzaW5nIGRsbWNfcmVmX2NsazAgaW5zdGVhZFxuIiwNCj4g
PiA+ICsJCQkgc3NfY2xvY2tfdHlwZSk7DQo+ID4gPiArCX0NCg0KQlIsDQpUaGluaA==
