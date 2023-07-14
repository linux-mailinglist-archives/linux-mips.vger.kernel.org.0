Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B67C3754460
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jul 2023 23:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjGNVol (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Jul 2023 17:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjGNVok (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Jul 2023 17:44:40 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C648A1BDA;
        Fri, 14 Jul 2023 14:44:38 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EGiu11002414;
        Fri, 14 Jul 2023 14:44:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=NwqPnsh9CooxqniGtkSBHpillF7YU2qS5JKh4uoDkJ4=;
 b=iVOODBGyI7P/LRM3qd91VR4aZ4csoOJoeKOfaUSZQei8btSU9JhdprK4sII8byqhzIuH
 2xabgdradB0o+Bj0xDdxgTQQ1q6Qa9gw4v1P8MFyv8G1DyJyumzr84FPXNwbItHMDVzS
 FlmYqAQAYtBPvmOrWtwQJxbWj1OY+yRzUrBKOFm1yo+KAun+Y9SacALxTjY2lhw0/2nL
 eNXl0myzQN1HjSMisIVninEl2Y2kNWh2Pn2ROQUPaH9d6q83N0kbcJMeuu7v+2Tu1yZ4
 a7TfELagAvL5FQszNQJvay68vMUd2a8Q9ZOHaacT6rNlHAlKqYY/jHkV7VF7lJequ+/0 Tg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3rtpvrdjgm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Jul 2023 14:44:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1689371065; bh=NwqPnsh9CooxqniGtkSBHpillF7YU2qS5JKh4uoDkJ4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=i7WnhQlkLP1p18ZxbORgwtgZQylYWoTIXQThNSG9NrFg3GlRS4UsWfyKdDxPDsHd/
         x9W1s8mabiMtTcqjYAN5jqOe0m5+bRAwmYZ4z97naUCzVLzegHG8SC6NxhXGn1OJcD
         MyNdNbumlT1LB4aQvoT0Z/NtBH8yqaL7BntLf1zZSe7jo/gX4K1YWNPJfwiUb/kGkW
         93NhfO1RIkUaCvMM/Gz9ONgPdyI/Jl6tF+WaaNInzlEAOgpeNzXZG6lVKtc6N+ig44
         smls63SERNkei4ENuAeeO5dRIxV7ReFWGz7l+iVEBjJYI7Y2m4FiiUtA5/cC7BcHEG
         loQwcrvf/uskw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ECC5740145;
        Fri, 14 Jul 2023 21:44:23 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 83D82A008A;
        Fri, 14 Jul 2023 21:44:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fM3ebk6V;
        dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C778E40525;
        Fri, 14 Jul 2023 21:44:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gn8rnZEF5Yw/inZH+s4n3LeThwiul24dXnyMfo7wO/Gwa3H8gKwbMsuA73cV7w+Nd0FXsWCCboP+XdkrdCUIMwnyWKQ8VLsHIUtoPhfOLni7LocR6/h/ghBSRqvJMilfnl3u3P0PmwhQj9xLQ+n+jLtgcBYaHBvaWCGmqemkZi/mvW9DJIGYrAZPqBWie7ccBz07IeDHRTXCDccPlYXOhFm7Oi+fqefhPfLKzgC+dVjcpQwh7j7JdUvOtCbJyVv0fgxqPaXK8EcWBWLYWN02jRabVMapRetvTgKu3tq1OyLe29KROz6WYy0j9Ux1IxNIySNooUuTMnmVzWz/n0ajkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwqPnsh9CooxqniGtkSBHpillF7YU2qS5JKh4uoDkJ4=;
 b=dP++G7SCrEXanGfgzoB3EvL3aJaohz7Q8uZ5aGBqqaZcSZSy/InNwn3CJkAiuVKdTw+TfZbp1JAexvkEMuy9Ox7Qg6u0K9ZIQeGSeSy5NAQZ+6+c9dXFEUkz83sGWK8dbC4kFZNLjVoAPilynfU3+x0xyGohwWBDJ1IlWzdV3D7muo7uzf4Fcyi8T+S3QBBUnJqnJ/fqjeCWT/wFgb40R+dUUa7glc8zCWgPLsL4asp8asRYJvcSungthSBhFZg10lTXQwdodAYHifJCYSCl2wItHMrtNDnczhcNrc9Qwb4thlhuAAgQab3AGNGXqYmZZnHbMKZxNYIOR1TUaZjwPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwqPnsh9CooxqniGtkSBHpillF7YU2qS5JKh4uoDkJ4=;
 b=fM3ebk6Vdy0FgRrz8cwwPJWc5Rcx2gMdDYXwZ6z5gSEtplHcVQ1rRQMAlE7SRFcXKDPbJXlbJwauHhoyGg9VcGQfTno/VK3NypGvSh6yqpELIHiwX7Z3CEvB8um92zsTVZq9mDJSr86RitrTzZ0q6RAnIA6RtyKwAyCNbnE19Ms=
Received: from BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 by SJ0PR12MB8165.namprd12.prod.outlook.com (2603:10b6:a03:4e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Fri, 14 Jul
 2023 21:44:12 +0000
Received: from BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::7a8:9367:70bf:2491]) by BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::7a8:9367:70bf:2491%6]) with mapi id 15.20.6588.028; Fri, 14 Jul 2023
 21:44:12 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] usb: dwc3: dwc3-octeon: Convert to glue driver
Thread-Topic: [PATCH v3 1/3] usb: dwc3: dwc3-octeon: Convert to glue driver
Thread-Index: AQHZtiZXAWPcN4Z/OUmCddveEx95Fa+5zFgA
Date:   Fri, 14 Jul 2023 21:44:12 +0000
Message-ID: <20230714214410.aohzxfxep5rkq6nb@synopsys.com>
References: <ZLD7RHvE4eRPoqKN@lenoch> <ZLD7nofcrg3ffeB/@lenoch>
In-Reply-To: <ZLD7nofcrg3ffeB/@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB4787:EE_|SJ0PR12MB8165:EE_
x-ms-office365-filtering-correlation-id: dabd44ad-d93e-491c-4003-08db84b376b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Ue0UEN4qNA2PmNd+D+ExRDehzydIj1llm2VTJEqxD6BjVBVNx9O+DothycpBmwBZPARA8P/A7eY7Avkl3mf55yzW8ECYeStKVppFH7BE9Kj1RgLFdV641LEuBBbLh2r65YZDgaPwgWLfr0vpRg8Oefi30WsocgNFigtECSxvyojrgdBCuDTneNUe0kcpKFZ7W0dsuobwj284m0KR7bHGM2TzWtJOOPAFGKSa9cr1zu/oXYUSJTvqbxElpeLGrXE9qHJ0M3v3nd1h73qHdTStr9VxgGzTO3QqHGIW3IXybhkM7nFBuYDQAU3dwQ2spa1VFwr6FU5IZiHlqsKUsfJCDtoltKZP6xitULTP1sDX3lu6Z2KcAye+a98BFLYLk/Jqsd3HIrBUqIWgFOoN7Mtvu2MM/K8m2JK/FdtivFvD5EsY+/KG6xbFjoxD2NcKLzyUxaXL85IqQAeFqK+UcOAPAzUu2sScR4n9mS8fvKfGVF0TvSE+D5OPL3YKfkZ646QkvXQXcLIo9Qd4exs5o6YzYWCMMvlinEIojCA/p5qg9UDf03bOKrYANBayovNr98V1g/9/SPOkWIStWjo1HOPJG+tCCQmAlzmI171OyCw6wYghLkNSf6pwao36/gmLGdF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4787.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199021)(38100700002)(38070700005)(86362001)(36756003)(6486002)(91956017)(76116006)(71200400001)(54906003)(122000001)(1076003)(26005)(478600001)(186003)(2616005)(6512007)(6506007)(2906002)(66446008)(316002)(66476007)(5660300002)(6916009)(66556008)(66946007)(8936002)(8676002)(83380400001)(64756008)(41300700001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVN5U1liTVpYakY3V0crRmpMeTd1SUlCdlNwU2U3cnY5WnIxT2c3emlpK0NP?=
 =?utf-8?B?c2E4YWhrekVFSHJNWWhBVi95eG51cENsc0RKazBGYk51RzRHdmRsRE1sbXk2?=
 =?utf-8?B?dmtLQko0M2RzZW5IM1lVaFVaRVdBWktLUElyNTU1UURuZEdPVUZwSS9KU09w?=
 =?utf-8?B?MUcrdXVudUJkL3NIZ3d1YmMyZFZ3VnZieklOS0wzOWcwQXBkdFpzY3N0cnZO?=
 =?utf-8?B?c2d0a3FncVk4bnRnc24xSTEyYmpPZkppZlRnbnF4WG1tS3UyQWxYQjhHYmUw?=
 =?utf-8?B?Um41QytpTnhmTG1rRVpLMzE2VnFBUmdKNDNhK0lRenc4NGQxaE1GbWFwSUNO?=
 =?utf-8?B?ei9HOXN5Z2toVTQzcmZTNlFucFNBSGpUclJCaHFDTnhTSWowR25wNUsrck04?=
 =?utf-8?B?cmgyMFpXWXFUZGpDeUNpQllibVBQMHpsU2tsejA5S21RLzh2dm5uOVY3eXNK?=
 =?utf-8?B?UU0xSTZ1OVplaGNYMHh3M0hxNy9JY0RFclpkOC9MNHJHU3YyS1hlZERmaElx?=
 =?utf-8?B?dkdVVzRPam9qdTN1Qy9mYUhxQVpRTlRzWHRNYXNlMWNubG9GOGx0UCtYNU9N?=
 =?utf-8?B?NkJheTVlZjByTmFDVWFGY2JDclkrUFhiMVFKcG9UOFJOaWV0NkR0K2ZlcWtu?=
 =?utf-8?B?ZHYyUVdYSkdGY1U1NWsxYVZKclBqK3U2c3NXZDZPOEFTbFA1Vk9neGFDVnJD?=
 =?utf-8?B?QU5VQnZFSXM4Y2YzdkpPVTZrYTJFZm9INnYvZFA2Y3ZuRXlKdnZTbjBVZElM?=
 =?utf-8?B?NkZ6dUtDamNGWXB5WWdCVW1YSHExU2t0Zzhmbm92MVZITG9tSEdweXcxNXda?=
 =?utf-8?B?eUVOc29QZ3N4U2JZY1V0dEwwY01udDFEcG1JT2dybzBpOHpsVFk1TTFzM1B5?=
 =?utf-8?B?Tndpa3pXSk1oclYvL3JZK0N3aEVLTW53ODRXNnBFbUdHMUltdlNYVEIwUDhN?=
 =?utf-8?B?K3dUNExHMmFyVXAxUzd4bGNPSU1XdXVUZlFvM2NubmwwQ2JnVTFsVE4wRzg0?=
 =?utf-8?B?TDc2ZWRka09pZklRM0JZaDdqUXljMWJ1UCthR2pXd2czOVk0MG8vUUVlL0JU?=
 =?utf-8?B?SHozb0E1R3VkMW1uTTJpNExlMDVKUTNNTGlKQ2sxRUdXa2czYVh0dHBQZUk4?=
 =?utf-8?B?bFFOV1ZveGxabDQvNE5tQ2l6SmhEaXQ4QWVWaGh3SWE5M3k3UkxnUXcyRVJr?=
 =?utf-8?B?UEV2TmpRNUhtN21VYVRtTSswa1NQdkJBbzMzdHNvOEUrZDdPWVNQTVp1eWRP?=
 =?utf-8?B?TFU5T0F0SVV1Mk1mMXR2MjFhUUUzQjdGR2xJNGl1ZjlqN3pHU3hjQ2pPOUtC?=
 =?utf-8?B?aTFJUGhTVHpRVEtnWmxGTzN5T2RDTnZhdnNYbGNJR21yZGQ5VDJNRzJGKzNS?=
 =?utf-8?B?Q3RoaG5LQlZHdjh4S1VqM1ErbFZWYzhZT1RmeEVFNUlwNlMvem9JeGZVbTY4?=
 =?utf-8?B?aEJkYVZrQlowWTJBbkd2eDZoNlgxMHV3ME1yL1pESHR6VVdCendzbjFKN1Vu?=
 =?utf-8?B?ZytJZ3JId2xDWmlLSndJWVZvb09ZR2l6SWxXaTBDTFVBTjNvTWJKa3ZnS0tC?=
 =?utf-8?B?SncvRlBtajg2dVhTcGJMRUM2VUtjRjJZWGpybGtoY1JPTXN2dFI3ZHdELytY?=
 =?utf-8?B?ZzNJUVFMZzc4SDA0SDRxRTBpVC80Skt4QlNzNEF1bTZEWWwyeE50cUlwUFlF?=
 =?utf-8?B?alNhVmdPazhIQjhqa1Z1SWJLRzlocksyTXFlV0RML0h1Z2NFSm1vZWorQjJR?=
 =?utf-8?B?TlRkeDhCVmV0SEZsVkRGTWVDTTIyMmMwK3lSZ0Nod2hzaVJEdEEzMmlBNXha?=
 =?utf-8?B?VEtxbTlLcjhTWFpJVDdzclR4dy9MZGpnUnNiaWxPanFHYjhwOUl4eS8rTEho?=
 =?utf-8?B?TW42eVdkL1hQQ1U5ZVd4UHhsZThod0EyRXo2MDVVQU1NS2NGc1hDZFdidHpm?=
 =?utf-8?B?QUZ5ZVdtMzg4UnRJRDB3dU1jbnp1M0UvTXhwR1J1RjJnaGxISGVuR0kvTkhJ?=
 =?utf-8?B?VUtSMzUraW1zUGJJUm4reXFLQnBvZE93K3FXbjQ2amZMYWh3V3l5MnF6N3ND?=
 =?utf-8?B?YktBclRmWGltMW9PeWFuSWsrUTBIUVlsYkY2ZEpQUllpd2huZExXR09DY2ZM?=
 =?utf-8?Q?4ZLZkNKwlAM1EQLJdLG36qN/l?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEEF9488D055D441BDE081564E68E031@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?eEtlZHlseHFhQkprZW9uRkl1Tm1MMHZPZnNBUW9rbDZNWGwvSnJvVWdqQTQ0?=
 =?utf-8?B?V2JWeUt3THZqRGhzMnNabnd0K3BER01lT3dUSUhNcmFsUElrZHRqTHhPMjha?=
 =?utf-8?B?Z2RweEgyQXZPWURpSitLdFBOdHVYeEN5VHY4bXNVMlFpZFFyelA2QzRFNGVx?=
 =?utf-8?B?Q2pucVFncEZvczdRWGdyRENhTi90ekw4d3lwUWNzejRLbGFBU0dVRFFwWmlP?=
 =?utf-8?B?N1ZWUGNTMlhGbGlqQUttdXhNWGVuc2UvcThoRXd2bFZ0aUdDamNXcDZhV09t?=
 =?utf-8?B?T3VMQjhzN3Axb1huQVpzZzQyaC9RMmpwckFva1I2YVAvR21RZ24rdjBlREEv?=
 =?utf-8?B?SDNVU09oNDAvUzhzbUlSa0Z2cVVka2pXdktCS3RMbTJPQzB4SE1ia0MrS0tj?=
 =?utf-8?B?QmxTRmtjN1p0a1c3bDlOcU9PS2phbWgxWlN0RFpBZTlWZzFkcjRUejQvOERx?=
 =?utf-8?B?OUFGdVdwYVJGYmt4ajhNMUQrWlpZQVpuQ2RXdnR6b3BwQ1dxRVgzRlYxejkw?=
 =?utf-8?B?M3o1R1NhUTArUlRvSUhwamx3T0ZVaTZLL2g2a3M5dVFPdTUzKzR4clVqc1dt?=
 =?utf-8?B?SWFBTVBScVhHcC94NkhOUXdSWFdRNUhYWm1hd0l6ZGZaczNrNTh2VUFzcTNX?=
 =?utf-8?B?NHBFU1pOVitkeFdWUHhOUXYwbldseFNvYUJwN2dxcGUzc1pMdUM5OHhYdkxp?=
 =?utf-8?B?L1dvNVRkMzQ2ZHFrcVdFN0hKazdJMWsrejRMZ2FzZ1NoenZtajdpTnhYVWla?=
 =?utf-8?B?TUlLWUNqbURkV2ZEK2F3VE9UOWhXcTBUc2RKSUF0Q2s5UjR3WWtEN1dyQ1RI?=
 =?utf-8?B?TUtBYllXVVhGWXlka1V4aVViNFFaZ1BGOEtkWENrL0hWTk1Nd2ZjVmtRSEVU?=
 =?utf-8?B?a1MxdkRyZFptZVVpRFFkNjdxNHJtcy8vWkxjVmd3eWc5RklFK21WblNkUCtZ?=
 =?utf-8?B?M2ZSZzQzQXJoTHE5dXYzaUxiNTdaV1FPOGJwUTBVeGFQYnNVYlBNUytsa0tF?=
 =?utf-8?B?TWpDUFhWQXJhMUlTY0VRV1RJRlgzbTdpbnlkckJDaXlPcGpqZ1E4c0dSYnpR?=
 =?utf-8?B?Z0VWTXpZNGwrbUd5djJ5bklUY3NjWStsRTJDWFJOOEQ3Q0FvbGsxTGRzZWE4?=
 =?utf-8?B?Qm1IdnpTWUpKTENZSmxtQmV3VkdUUnoyb0kyaUptaUJlS2Njd2dMQmwvQ3N0?=
 =?utf-8?B?Vy9xektiZlpXeFdxYlVGME5pbU8rOWF2Vk5wbG5HdVZHamNsL2JIWkhRQzVk?=
 =?utf-8?Q?4mvKWW2PKxiSYIY?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dabd44ad-d93e-491c-4003-08db84b376b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 21:44:12.8714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cLyXURNbn6h/fHvfDPcpGdVREveiW5JYgdHr9aR6DGpmMiSPZjQ4FMDBh3BjEUNlrsnkfgf/36jz/Jp09hT31g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8165
X-Proofpoint-ORIG-GUID: 6YGruUiclPYm9MNrTtuYdGfdYIwUONSK
X-Proofpoint-GUID: 6YGruUiclPYm9MNrTtuYdGfdYIwUONSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_10,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307140199
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gRnJpLCBKdWwgMTQsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBGcm9tOiBMYWRp
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBEV0MzIGFzIGltcGxlbWVu
dGVkIGluIENhdml1bSBTb0MgaXMgdXNpbmcgVUNUTCBicmlkZ2UgdW5pdA0KPiBiZXR3ZWVuIEkv
TyBpbnRlcmNvbm5lY3QgYW5kIFVTQiBjb250cm9sbGVyLg0KPiANCj4gQ3VycmVudGx5IHRoZXJl
IGlzIG5vIGJvbmQgd2l0aCBkd2MzIGNvcmUgY29kZSwgc28gaWYgYW55dGhpbmcgZ29lcw0KPiB3
cm9uZyBpbiBVQ1RMIHNldHVwIGR3YzMgaXMgbGVmdCBpbiByZXNldCwgd2hpY2ggbGVhZHMgdG8g
YnVzIGVycm9yDQo+IHdoaWxlIHRyeWluZyB0byByZWFkIGFueSBkZXZpY2UgcmVnaXN0ZXIuIFRo
dXMgYW55IGZhaWx1cmUgaW4gVUNUTA0KPiBpbml0aWFsaXphdGlvbiBlbmRzIHdpdGgga2VybmVs
IHBhbmljLg0KPiANCj4gVG8gYXZvaWQgdGhpcyBtb3ZlIE9jdGVvbiBEV0MzIGdsdWUgY29kZSBm
cm9tIGFyY2gvbWlwcyBhbmQgbWFrZSBpdA0KPiBwcm9wZXIgZ2x1ZSBkcml2ZXIgd2hpY2ggaXMg
dXNlZCBpbnN0ZWFkIG9mIGR3YzMtb2Ytc2ltcGxlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGFk
aXNsYXYgTWljaGwgPGxhZGlzQGxpbnV4LW1pcHMub3JnPg0KPiBBY2tlZC1ieTogVGhvbWFzIEJv
Z2VuZG9lcmZlciA8dHNib2dlbmRAYWxwaGEuZnJhbmtlbi5kZT4NCj4gLS0tDQo+ICBDSEFOR0VT
Og0KPiAgLSB2Mjogc3F1YXNoZWQgbW92ZSBhbmQgZ2x1ZSBjb252ZXJzaW9uIHBhdGNoLCBmaXhl
ZCBzcGFyc2Ugd2FybmluZw0KPiAgICAgICAgYW5kIGZvcm1hdHRpbmcgaXNzdWUuIFNldCBwcml2
YXRlIGRhdGEgYXQgdGhlIGVuZCBvZiBwcm9iZS4NCj4gICAgICAgIENsZWFyIGRydmRhdGEgb24g
cmVtb3ZlLiBBZGRlZCBob3N0IG1vZGUgb25seSBub3RpY2UuDQo+ICAgICAgICBDb2xsZWN0ZWQg
YWNrIGZvciBtb3ZlIGZyb20gYXJjaC9taXBzLg0KPiAgLSB2MzogbW9yZSBkZXNjcmlwdGl2ZSBj
b21taXQgbWVzc2FnZSwgZHJvcHBlZCB1bnJlbGF0ZWQgY2hhbmdlcw0KPiANCj4gIGFyY2gvbWlw
cy9jYXZpdW0tb2N0ZW9uL01ha2VmaWxlICAgICAgICAgICAgICB8ICAgMSAtDQo+ICBhcmNoL21p
cHMvY2F2aXVtLW9jdGVvbi9vY3Rlb24tcGxhdGZvcm0uYyAgICAgfCAgIDEgLQ0KPiAgZHJpdmVy
cy91c2IvZHdjMy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgIDEwICsrDQo+ICBkcml2
ZXJzL3VzYi9kd2MzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgLi4u
L3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMgICAgICAgICAgICAgICAgICAgIHwgMTA0ICsrKysrKysr
KystLS0tLS0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLW9mLXNpbXBsZS5jICAgICAgICAg
ICAgIHwgICAxIC0NCj4gIDYgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKSwgNTEgZGVs
ZXRpb25zKC0pDQo+ICByZW5hbWUgYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXVzYi5j
ID0+IGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYyAoOTElKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL01ha2VmaWxlIGIvYXJjaC9taXBzL2Nhdml1bS1v
Y3Rlb24vTWFrZWZpbGUNCj4gaW5kZXggN2MwMmU1NDI5NTlhLi4yYTU5MjY1Nzg4NDEgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL01ha2VmaWxlDQo+ICsrKyBiL2FyY2gv
bWlwcy9jYXZpdW0tb2N0ZW9uL01ha2VmaWxlDQo+IEBAIC0xOCw0ICsxOCwzIEBAIG9iai15ICs9
IGNyeXB0by8NCj4gIG9iai0kKENPTkZJR19NVEQpCQkgICAgICArPSBmbGFzaF9zZXR1cC5vDQo+
ICBvYmotJChDT05GSUdfU01QKQkJICAgICAgKz0gc21wLm8NCj4gIG9iai0kKENPTkZJR19PQ1RF
T05fSUxNKQkgICAgICArPSBvY3RfaWxtLm8NCj4gLW9iai0kKENPTkZJR19VU0IpCQkgICAgICAr
PSBvY3Rlb24tdXNiLm8NCj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL29j
dGVvbi1wbGF0Zm9ybS5jIGIvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXBsYXRmb3Jt
LmMNCj4gaW5kZXggY2UwNWMwZGQzYWNkLi4yMzVjNzdjZTdiMTggMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvbWlwcy9jYXZpdW0tb2N0ZW9uL29jdGVvbi1wbGF0Zm9ybS5jDQo+ICsrKyBiL2FyY2gvbWlw
cy9jYXZpdW0tb2N0ZW9uL29jdGVvbi1wbGF0Zm9ybS5jDQo+IEBAIC00NTAsNyArNDUwLDYgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb2N0ZW9uX2lkc1tdIF9faW5pdGNvbnN0
ID0gew0KPiAgCXsgLmNvbXBhdGlibGUgPSAiY2F2aXVtLG9jdGVvbi0zODYwLWJvb3RidXMiLCB9
LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAiY2F2aXVtLG1kaW8tbXV4IiwgfSwNCj4gIAl7IC5jb21w
YXRpYmxlID0gImdwaW8tbGVkcyIsIH0sDQo+IC0JeyAuY29tcGF0aWJsZSA9ICJjYXZpdW0sb2N0
ZW9uLTcxMzAtdXNiLXVjdGwiLCB9LA0KPiAgCXt9LA0KPiAgfTsNCj4gIA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnIGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnDQo+
IGluZGV4IGJlOTU0YTlhYmJlMC4uOThlZmNiYjc2Yzg4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnDQo+IEBA
IC0xNjgsNCArMTY4LDE0IEBAIGNvbmZpZyBVU0JfRFdDM19BTTYyDQo+ICAJICBUaGUgRGVzaWdu
d2FyZSBDb3JlIFVTQjMgSVAgaXMgcHJvZ3JhbW1lZCB0byBvcGVyYXRlIGluDQo+ICAJICBpbiBV
U0IgMi4wIG1vZGUgb25seS4NCj4gIAkgIFNheSAnWScgb3IgJ00nIGhlcmUgaWYgeW91IGhhdmUg
b25lIHN1Y2ggZGV2aWNlDQo+ICsNCj4gK2NvbmZpZyBVU0JfRFdDM19PQ1RFT04NCj4gKwl0cmlz
dGF0ZSAiQ2F2aXVtIE9jdGVvbiBQbGF0Zm9ybXMiDQo+ICsJZGVwZW5kcyBvbiBDQVZJVU1fT0NU
RU9OX1NPQyB8fCBDT01QSUxFX1RFU1QNCj4gKwlkZWZhdWx0IFVTQl9EV0MzDQo+ICsJaGVscA0K
PiArCSAgU3VwcG9ydCBDYXZpdW0gT2N0ZW9uIHBsYXRmb3JtcyB3aXRoIERlc2lnbldhcmUgQ29y
ZSBVU0IzIElQLg0KPiArCSAgT25seSB0aGUgaG9zdCBtb2RlIGlzIGN1cnJlbnRseSBzdXBwb3J0
ZWQuDQo+ICsJICBTYXkgJ1knIG9yICdNJyBoZXJlIGlmIHlvdSBoYXZlIG9uZSBzdWNoIGRldmlj
ZS4NCj4gKw0KPiAgZW5kaWYNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvTWFrZWZp
bGUgYi9kcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxlDQo+IGluZGV4IDlmNjZiZDgyYjYzOS4uZmUx
NDkzZDRiYmU1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxlDQo+ICsr
KyBiL2RyaXZlcnMvdXNiL2R3YzMvTWFrZWZpbGUNCj4gQEAgLTU0LDMgKzU0LDQgQEAgb2JqLSQo
Q09ORklHX1VTQl9EV0MzX1NUKQkJKz0gZHdjMy1zdC5vDQo+ICBvYmotJChDT05GSUdfVVNCX0RX
QzNfUUNPTSkJCSs9IGR3YzMtcWNvbS5vDQo+ICBvYmotJChDT05GSUdfVVNCX0RXQzNfSU1YOE1Q
KQkJKz0gZHdjMy1pbXg4bXAubw0KPiAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX1hJTElOWCkJCSs9
IGR3YzMteGlsaW54Lm8NCj4gK29iai0kKENPTkZJR19VU0JfRFdDM19PQ1RFT04pCQkrPSBkd2Mz
LW9jdGVvbi5vDQo+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMvY2F2aXVtLW9jdGVvbi9vY3Rlb24t
dXNiLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4gc2ltaWxhcml0eSBpbmRl
eCA5MSUNCj4gcmVuYW1lIGZyb20gYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXVzYi5j
DQo+IHJlbmFtZSB0byBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4gaW5kZXggMmFk
ZDQzNWFkMDM4Li42OWJhYzYxY2NiZTAgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvbWlwcy9jYXZpdW0t
b2N0ZW9uL29jdGVvbi11c2IuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9u
LmMNCj4gQEAgLTE4Nyw3ICsxODcsMTAgQEANCj4gICNkZWZpbmUgVVNCRFJEX1VDVExfRUNDCQkJ
CTB4ZjANCj4gICNkZWZpbmUgVVNCRFJEX1VDVExfU1BBUkUxCQkJMHhmOA0KPiAgDQo+IC1zdGF0
aWMgREVGSU5FX01VVEVYKGR3YzNfb2N0ZW9uX2Nsb2Nrc19tdXRleCk7DQo+ICtzdHJ1Y3QgZHdj
M19kYXRhIHsNCg0KQ2FuIHdlIHJlbmFtZSB0aGlzIHRvIGR3YzNfb2N0ZW9uPyBJdCB3b3VsZCBi
ZSBjb25zaXN0ZW50IHdpdGggb3RoZXINCmdsdWUgZHJpdmVycywgYW5kIGl0J3MgY2xlYXJlciB0
aGF0IHRoaXMgaXMgT2N0ZW9uJ3Mgc3BlY2lmaWMuDQoNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXY7
DQo+ICsJdm9pZCBfX2lvbWVtICpiYXNlOw0KPiArfTsNCj4gIA0KPiAgI2lmZGVmIENPTkZJR19D
QVZJVU1fT0NURU9OX1NPQw0KPiAgI2luY2x1ZGUgPGFzbS9vY3Rlb24vb2N0ZW9uLmg+DQo+IEBA
IC0yMzMsNiArMjM2LDExIEBAIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgZHdjM19vY3Rlb25fcmVh
ZHEodm9pZCBfX2lvbWVtICphZGRyKQ0KPiAgc3RhdGljIGlubGluZSB2b2lkIGR3YzNfb2N0ZW9u
X3dyaXRlcSh2b2lkIF9faW9tZW0gKmJhc2UsIHVpbnQ2NF90IHZhbCkgeyB9DQo+ICANCj4gIHN0
YXRpYyBpbmxpbmUgdm9pZCBkd2MzX29jdGVvbl9jb25maWdfZ3BpbyhpbnQgaW5kZXgsIGludCBn
cGlvKSB7IH0NCj4gKw0KPiArc3RhdGljIHVpbnQ2NF90IG9jdGVvbl9nZXRfaW9fY2xvY2tfcmF0
ZSh2b2lkKQ0KPiArew0KPiArCXJldHVybiAxNTAwMDAwMDA7DQo+ICt9DQo+ICAjZW5kaWYNCj4g
IA0KPiAgc3RhdGljIGludCBkd2MzX29jdGVvbl9nZXRfZGl2aWRlcih2b2lkKQ0KPiBAQCAtNDk0
LDU4ICs1MDIsNTggQEAgc3RhdGljIHZvaWQgX19pbml0IGR3YzNfb2N0ZW9uX3BoeV9yZXNldCh2
b2lkIF9faW9tZW0gKmJhc2UpDQo+ICAJZHdjM19vY3Rlb25fd3JpdGVxKHVjdGxfY3RsX3JlZywg
dmFsKTsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGludCBfX2luaXQgZHdjM19vY3Rlb25fZGV2aWNl
X2luaXQodm9pZCkNCj4gK3N0YXRpYyBpbnQgZHdjM19vY3Rlb25fcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gLQljb25zdCBjaGFyIGNvbXBhdF9ub2RlX25hbWVb
XSA9ICJjYXZpdW0sb2N0ZW9uLTcxMzAtdXNiLXVjdGwiOw0KPiAtCXN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXY7DQo+IC0Jc3RydWN0IGRldmljZV9ub2RlICpub2RlOw0KPiAtCXN0cnVjdCBy
ZXNvdXJjZSAqcmVzOw0KPiAtCXZvaWQgX19pb21lbSAqYmFzZTsNCj4gKwlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiArCXN0cnVjdCBkd2MzX2RhdGEgKmRhdGE7DQoNCkNhbiB3
ZSByZW5hbWUgImRhdGEiIHZhcmlhYmxlIGhlcmUgYW5kIG90aGVyIHBsYWNlcyB0byBvY3Rlb24/
DQoNCj4gKwlpbnQgZXJyOw0KPiAgDQo+IC0JLyoNCj4gLQkgKiBUaGVyZSBzaG91bGQgb25seSBi
ZSB0aHJlZSB1bml2ZXJzYWwgY29udHJvbGxlcnMsICJ1Y3RsIg0KPiAtCSAqIGluIHRoZSBkZXZp
Y2UgdHJlZS4gVHdvIFVTQiBhbmQgYSBTQVRBLCB3aGljaCB3ZSBpZ25vcmUuDQo+IC0JICovDQo+
IC0Jbm9kZSA9IE5VTEw7DQo+IC0JZG8gew0KPiAtCQlub2RlID0gb2ZfZmluZF9ub2RlX2J5X25h
bWUobm9kZSwgInVjdGwiKTsNCj4gLQkJaWYgKCFub2RlKQ0KPiAtCQkJcmV0dXJuIC1FTk9ERVY7
DQo+IC0NCj4gLQkJaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5vZGUsIGNvbXBhdF9ub2Rl
X25hbWUpKSB7DQo+IC0JCQlwZGV2ID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShub2RlKTsNCj4g
LQkJCWlmICghcGRldikNCj4gLQkJCQlyZXR1cm4gLUVOT0RFVjsNCj4gLQ0KPiAtCQkJLyoNCj4g
LQkJCSAqIFRoZSBjb2RlIGJlbG93IG1hcHMgaW4gdGhlIHJlZ2lzdGVycyBuZWNlc3NhcnkgZm9y
DQo+IC0JCQkgKiBzZXR0aW5nIHVwIHRoZSBjbG9ja3MgYW5kIHJlc2V0aW5nIFBIWXMuIFdlIG11
c3QNCj4gLQkJCSAqIHJlbGVhc2UgdGhlIHJlc291cmNlcyBzbyB0aGUgZHdjMyBzdWJzeXN0ZW0g
ZG9lc24ndA0KPiAtCQkJICoga25vdyB0aGUgZGlmZmVyZW5jZS4NCj4gLQkJCSAqLw0KPiAtCQkJ
YmFzZSA9IGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAsICZy
ZXMpOw0KPiAtCQkJaWYgKElTX0VSUihiYXNlKSkgew0KPiAtCQkJCXB1dF9kZXZpY2UoJnBkZXYt
PmRldik7DQo+IC0JCQkJcmV0dXJuIFBUUl9FUlIoYmFzZSk7DQo+IC0JCQl9DQo+ICsJZGF0YSA9
IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZGF0YSksIEdGUF9LRVJORUwpOw0KPiArCWlmICgh
ZGF0YSkNCj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ICANCj4gLQkJCW11dGV4X2xvY2soJmR3YzNf
b2N0ZW9uX2Nsb2Nrc19tdXRleCk7DQo+IC0JCQlpZiAoZHdjM19vY3Rlb25fY2xvY2tzX3N0YXJ0
KCZwZGV2LT5kZXYsIGJhc2UpID09IDApDQo+IC0JCQkJZGV2X2luZm8oJnBkZXYtPmRldiwgImNs
b2NrcyBpbml0aWFsaXplZC5cbiIpOw0KPiAtCQkJZHdjM19vY3Rlb25fc2V0X2VuZGlhbl9tb2Rl
KGJhc2UpOw0KPiAtCQkJZHdjM19vY3Rlb25fcGh5X3Jlc2V0KGJhc2UpOw0KPiAtCQkJbXV0ZXhf
dW5sb2NrKCZkd2MzX29jdGVvbl9jbG9ja3NfbXV0ZXgpOw0KPiAtCQkJZGV2bV9pb3VubWFwKCZw
ZGV2LT5kZXYsIGJhc2UpOw0KPiAtCQkJZGV2bV9yZWxlYXNlX21lbV9yZWdpb24oJnBkZXYtPmRl
diwgcmVzLT5zdGFydCwNCj4gLQkJCQkJCXJlc291cmNlX3NpemUocmVzKSk7DQo+IC0JCQlwdXRf
ZGV2aWNlKCZwZGV2LT5kZXYpOw0KPiAtCQl9DQo+IC0JfSB3aGlsZSAobm9kZSAhPSBOVUxMKTsN
Cj4gKwlkYXRhLT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAp
Ow0KPiArCWlmIChJU19FUlIoZGF0YS0+YmFzZSkpDQo+ICsJCXJldHVybiBQVFJfRVJSKGRhdGEt
PmJhc2UpOw0KPiAgDQo+IC0JcmV0dXJuIDA7DQo+ICsJZXJyID0gZHdjM19vY3Rlb25fY2xvY2tz
X3N0YXJ0KGRldiwgZGF0YS0+YmFzZSk7DQo+ICsJaWYgKGVycikNCj4gKwkJcmV0dXJuIGVycjsN
Cj4gKw0KPiArCWR3YzNfb2N0ZW9uX3NldF9lbmRpYW5fbW9kZShkYXRhLT5iYXNlKTsNCj4gKwlk
d2MzX29jdGVvbl9waHlfcmVzZXQoZGF0YS0+YmFzZSk7DQo+ICsNCj4gKwlkYXRhLT5kZXYgPSBk
ZXY7DQo+ICsJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZGF0YSk7DQo+ICsNCj4gKwlyZXR1
cm4gb2ZfcGxhdGZvcm1fcG9wdWxhdGUobm9kZSwgTlVMTCwgTlVMTCwgZGV2KTsNCj4gK30NCj4g
Kw0KPiArc3RhdGljIHZvaWQgZHdjM19vY3Rlb25fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzNfZGF0YSAqZGF0YSA9IHBsYXRmb3JtX2dl
dF9kcnZkYXRhKHBkZXYpOw0KPiArDQo+ICsJb2ZfcGxhdGZvcm1fZGVwb3B1bGF0ZShkYXRhLT5k
ZXYpOw0KPiArCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwpOw0KPiAgfQ0KPiAtZGV2
aWNlX2luaXRjYWxsKGR3YzNfb2N0ZW9uX2RldmljZV9pbml0KTsNCj4gIA0KPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdjM19vY3Rlb25fb2ZfbWF0Y2hbXSA9IHsNCj4gKwl7
IC5jb21wYXRpYmxlID0gImNhdml1bSxvY3Rlb24tNzEzMC11c2ItdWN0bCIgfSwNCj4gKwl7IH0s
DQo+ICt9Ow0KPiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZHdjM19vY3Rlb25fb2ZfbWF0Y2gp
Ow0KPiArDQo+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBkd2MzX29jdGVvbl9kcml2
ZXIgPSB7DQo+ICsJLnByb2JlCQk9IGR3YzNfb2N0ZW9uX3Byb2JlLA0KPiArCS5yZW1vdmVfbmV3
CT0gZHdjM19vY3Rlb25fcmVtb3ZlLA0KPiArCS5kcml2ZXIJCT0gew0KPiArCQkubmFtZQk9ICJk
d2MzLW9jdGVvbiIsDQo+ICsJCS5vZl9tYXRjaF90YWJsZSA9IGR3YzNfb2N0ZW9uX29mX21hdGNo
LA0KPiArCX0sDQo+ICt9Ow0KPiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihkd2MzX29jdGVvbl9k
cml2ZXIpOw0KPiArDQo+ICtNT0RVTEVfQUxJQVMoInBsYXRmb3JtOmR3YzMtb2N0ZW9uIik7DQo+
ICBNT0RVTEVfQVVUSE9SKCJEYXZpZCBEYW5leSA8ZGF2aWQuZGFuZXlAY2F2aXVtLmNvbT4iKTsN
Cj4gIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gLU1PRFVMRV9ERVNDUklQVElPTigiVVNCIGRy
aXZlciBmb3IgT0NURU9OIElJSSBTb0MiKTsNCj4gK01PRFVMRV9ERVNDUklQVElPTigiRGVzaWdu
V2FyZSBVU0IzIE9DVEVPTiBJSUkgR2x1ZSBMYXllciIpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLW9mLXNpbXBsZS5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9mLXNp
bXBsZS5jDQo+IGluZGV4IDdlNmFkOGZlNjFhNS4uZDE1MzlmYzllYWJkIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2Ytc2ltcGxlLmMNCj4gKysrIGIvZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLW9mLXNpbXBsZS5jDQo+IEBAIC0xNzAsNyArMTcwLDYgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkZXZfcG1fb3BzIGR3YzNfb2Zfc2ltcGxlX2Rldl9wbV9vcHMgPSB7DQo+ICANCj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9mX2R3YzNfc2ltcGxlX21hdGNoW10g
PSB7DQo+ICAJeyAuY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMzOTktZHdjMyIgfSwNCj4gLQl7
IC5jb21wYXRpYmxlID0gImNhdml1bSxvY3Rlb24tNzEzMC11c2ItdWN0bCIgfSwNCj4gIAl7IC5j
b21wYXRpYmxlID0gInNwcmQsc2M5ODYwLWR3YzMiIH0sDQo+ICAJeyAuY29tcGF0aWJsZSA9ICJh
bGx3aW5uZXIsc3VuNTBpLWg2LWR3YzMiIH0sDQo+ICAJeyAuY29tcGF0aWJsZSA9ICJoaXNpbGlj
b24saGkzNjcwLWR3YzMiIH0sDQo+IC0tIA0KPiAyLjM5LjINCj4gDQoNCkFmdGVyIHRoZSBjaGFu
Z2UsIHlvdSBjYW4gYWRkIG15IEFjazoNCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmgu
Tmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=
