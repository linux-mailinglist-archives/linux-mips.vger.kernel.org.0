Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C30370B3B
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 23:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730502AbfGVVWU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 17:22:20 -0400
Received: from mail-eopbgr690105.outbound.protection.outlook.com ([40.107.69.105]:23897
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731366AbfGVVWU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 17:22:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5pNBGn7sflHT0FYmzFbHFXDYyFzHJKO/P9IXuWz1SvuBYAxpH9Vp5pi29z18eTZV5pVMAlVCze/PQoo9E3Hx2Dr2kevbnmSVVYJxYZ3+sBxQiFGiCfN4vCXrBJCEoBXQkGrTlwA0apoP8nnJ30gNZm3VXyazdKhwRGuOPw50rzjaKb98s6GpJsj1EL92lYMVi7AxmdxJLIALnp6cy3PvXIPU0J1P3W9Sk1KB66PEuAjiGqvlTGvCR5AFljO5kj8UjWJLqTVkAtEgRP372QRAiHEQ3g4mPFoZt765pviwD5NMCk/34Dw3+RTfijuGo2k3BILxXHbYTKxtlPmC+s0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiE9OxVWFdNbxYSZD+EwETFtU40FAyW0/Lvk/26nE/0=;
 b=Bm6qrbTqsW8vPXMmUy63S5mbFhQEhG2cYFWmMOdxzcAvYK/Yb8XdUweF1s27qgGW3fBIQiv/f7+lcoOR5zg7U7BRdAUSwud8AcVuV6wOwV/r9yrIHLeYnFbQ6sR57wfYJMPKULA4NKFf3n1I8beo4g+7YQSB/VfrjOQVQYLXqFWfAwF1AgDpzuFbxu6BeK0gSTwLF26OiCbOTGmZRbLsm096dxcImgYkYknzb3O0N2aQQtzdSKySZEz4yhJ1c7yJ5nYL1gUZtD8nOC5VtLJ0hCbYTs3a9dcEP0VvJs+xy9SRmBI0eWwIg9vp/capNYvACXNANf0JZWq5D/tYRP1UcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiE9OxVWFdNbxYSZD+EwETFtU40FAyW0/Lvk/26nE/0=;
 b=hmQiSN4aYTSEWhfUc9bG53vIUeHXmfjzkkRTnZ7RVW9oqyOzNw5n9MEA8T8GpptJINfdXxaPP3OgcqlZ0+pXD+E30dfPBw9in38IlAbD1Iik4vPqm6VlmContPNpUEoF4NIg8se9m7tj0Zlc6witB3fImBr2yRZ7qVMI04VIpVU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1757.namprd22.prod.outlook.com (10.164.133.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Mon, 22 Jul 2019 21:22:15 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 21:22:15 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Dmitry Korotin <dkorotin@wavecomp.com>
CC:     Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] pte_special()/pte_mkspecial() support added.
Thread-Topic: [PATCH] pte_special()/pte_mkspecial() support added.
Thread-Index: AQHVJhxiFj4Vd2DAQk+q0ZxAK6DWB6bXWtWA
Date:   Mon, 22 Jul 2019 21:22:15 +0000
Message-ID: <MWHPR2201MB1277A2A9E3D2DDFCC27FD264C1C40@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <CY4PR22MB02459E11B2FD5E241F8C30C2AFEA0@CY4PR22MB0245.namprd22.prod.outlook.com>
In-Reply-To: <CY4PR22MB02459E11B2FD5E241F8C30C2AFEA0@CY4PR22MB0245.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::39) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14112f66-b769-4a00-8e83-08d70eeaaad5
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1757;
x-ms-traffictypediagnostic: MWHPR2201MB1757:
x-microsoft-antispam-prvs: <MWHPR2201MB17570A3C7AF29F24607D9AF2C1C40@MWHPR2201MB1757.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(39850400004)(346002)(136003)(366004)(199004)(189003)(66446008)(66476007)(3846002)(6116002)(66556008)(66066001)(6436002)(64756008)(66946007)(52536014)(25786009)(14454004)(558084003)(476003)(8676002)(9686003)(305945005)(74316002)(7736002)(99286004)(71190400001)(52116002)(256004)(71200400001)(4326008)(6246003)(26005)(81156014)(68736007)(186003)(8936002)(6862004)(81166006)(2906002)(478600001)(486006)(11346002)(446003)(5660300002)(55016002)(53936002)(316002)(54906003)(42882007)(33656002)(386003)(7696005)(6506007)(102836004)(76176011)(229853002)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1757;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5BdbmFTF35klcNtk5smO7XDdUqyG4xxeKShxC9gcCoAGwkf+VK5FXacVfgOke7Qi2IRBa6Lis9qK5bmNrdIElDJtzrWwVxqDiLsW3ccyXgpZZpJU6WSWBc9T8FhIRyfrvqoqVL3Kigt0FsHkX10atzuiRJ9CLYnxdOaS1b1A1HpFoeD7yvoIucNTU5SGSMfnovQMEml/Mv0IFbBifbg3ORPCiAxprvAOj/lx3/1b6YToDntE547JHEtOPAfvT3Palk3fNuvBe1L58XZN+5DFBcpiDWFgItGne8JFsKiu70fTmE3CAWq1CgVgIb5Mzuna0fciFGStnftAj2W4NV/oQvw36/zB2fdmrtNC3lb7szALqzBQt5gZpU9EfwSi6awn2cI7l63pwgNrRJ85bTkALTTe6JVyn/EO4/EnWbTLsyQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14112f66-b769-4a00-8e83-08d70eeaaad5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 21:22:15.3577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1757
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Dmitry Korotin wrote:
> pte_special()/pte_mkspecial() support added.
>=20
> Signed-off-by: Dmitry Korotin <dkorotin@wavecomp.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
