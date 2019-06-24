Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34E651CF4
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731729AbfFXVQY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:16:24 -0400
Received: from mail-eopbgr790098.outbound.protection.outlook.com ([40.107.79.98]:2896
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732238AbfFXVQY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 17:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeEadpoXz1gQ6wNP1BT3coLPN1q/WTpMIlZxxXtkZiI=;
 b=U/Ufl5iO/eNRd1ndf40/HHboll/eg78BeJh3hNUG8SOdLcfJDDuXQbd8XQZAxCXlb6LmxKoqIzLOwOyShWh8LS+ppqDwkmeN/WfXcDLK0oyOVBPTSx2uhKiikJX9vo+U11LIeg5XTbUEi7kT8vcKJ8w1XAzq0WybYiYmeaARS1g=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1375.namprd22.prod.outlook.com (10.174.160.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 21:16:22 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 21:16:22 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Stefan Roese <sr@denx.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 6/8 v2] MIPS: ralink: mt7628a.dtsi: Add SPI controller DT
 node
Thread-Topic: [PATCH 6/8 v2] MIPS: ralink: mt7628a.dtsi: Add SPI controller DT
 node
Thread-Index: AQHVFGx5JcpQD1LXTU67J09lWSp/Oaare0kA
Date:   Mon, 24 Jun 2019 21:16:21 +0000
Message-ID: <MWHPR2201MB1277442A7982B8DB6A787055C1E00@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190527091323.4582-6-sr@denx.de>
In-Reply-To: <20190527091323.4582-6-sr@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:74::28) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e32af57-abfd-4e27-f026-08d6f8e934b8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1375;
x-ms-traffictypediagnostic: MWHPR2201MB1375:
x-microsoft-antispam-prvs: <MWHPR2201MB1375C634D4647760B3EBFF39C1E00@MWHPR2201MB1375.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39840400004)(366004)(136003)(189003)(199004)(186003)(305945005)(26005)(3846002)(11346002)(33656002)(446003)(81166006)(81156014)(8676002)(6916009)(54906003)(99286004)(14454004)(102836004)(386003)(6506007)(2906002)(25786009)(4326008)(8936002)(6116002)(66066001)(9686003)(476003)(66556008)(66446008)(52116002)(53936002)(64756008)(73956011)(7696005)(4744005)(66476007)(42882007)(66946007)(6436002)(316002)(74316002)(6246003)(71190400001)(71200400001)(5660300002)(486006)(52536014)(7736002)(256004)(68736007)(55016002)(478600001)(44832011)(229853002)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1375;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UCNE/K+KE0wAP32xKQfAtTFyWv+LsWwJgLRzNm3qMaiJ/sYGAtlzGvgoMcgATIhsHz+mndHcZc0LdXWpPP88oh0cm2ELbmSYIvMi2jJ2PXFaNxFvaswg3V6h8belh6DFTXtoyMgW8BOdx2QjaoIbo98yGpCklKitVcYgJq50fBW3vHKnqjdcYv9Lit+Jh9JEw0MZF3fI05xY7LJjl/xPiWN6aM2G4vU+xLXesholP9fTDutE/YMQhVZjk+WnUHU6SOY4sY+WjlmKsnzAj4D0mrIEe/1pIujQ+R+1OTa1JVqmgXLtZYNPizXFDihuSNySqO2aDCu4T8jkyffoZBXlvZ3WvVWQuqZ4RQDJaUSGQmwvI4s65NPUS9/jhTD46rY2zC06Ju8nHE4S+sj4b2YJWUHanEumZuV2uDY/C49oF5A=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e32af57-abfd-4e27-f026-08d6f8e934b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 21:16:21.7449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1375
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClN0ZWZhbiBSb2VzZSB3cm90ZToNCj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBTUEkg
Y29udHJvbGxlciBkZXNjcmlwdGlvbiB0byB0aGUgTVQ3NjI4QSBkdHNpIGZpbGUuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBTdGVmYW4gUm9lc2UgPHNyQGRlbnguZGU+DQo+IENjOiBQYXVsIEJ1cnRv
biA8cGF1bC5idXJ0b25AbWlwcy5jb20+DQo+IENjOiBIYXJ2ZXkgSHVudCA8aGFydmV5aHVudG5l
eHVzQGdtYWlsLmNvbT4NCj4gQ2M6IEpvaG4gQ3Jpc3BpbiA8am9obkBwaHJvemVuLm9yZz4NCg0K
QXBwbGllZCB0byBtaXBzLW5leHQuDQoNClRoYW5rcywNCiAgICBQYXVsDQoNClsgVGhpcyBtZXNz
YWdlIHdhcyBhdXRvLWdlbmVyYXRlZDsgaWYgeW91IGJlbGlldmUgYW55dGhpbmcgaXMgaW5jb3Jy
ZWN0DQogIHRoZW4gcGxlYXNlIGVtYWlsIHBhdWwuYnVydG9uQG1pcHMuY29tIHRvIHJlcG9ydCBp
dC4gXQ0K
