Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8FB293420
	for <lists+linux-mips@lfdr.de>; Tue, 20 Oct 2020 06:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391476AbgJTEm4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Oct 2020 00:42:56 -0400
Received: from mail-eopbgr1320129.outbound.protection.outlook.com ([40.107.132.129]:52973
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391382AbgJTEm4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 20 Oct 2020 00:42:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdnJ+RO0geOLG/SCeQ/gvmcgOZe/J52HejfbTHQ/ArGItCU1uZzpe4EWYdOaUdP5HlXFKWqD4PtAu6+tzk4cVKHJVka3nKStJzuRBPHCDa15/1fYBswh4BbAERNPHroCszDjDCDu6/LMSX2VH7NGRzEm05QwXe1O2t9XKlPrdunWp0rmq99PyHYelf/r2c4dVmISzi9XPZt4DtLqLp7tYZTNsU4k01EN/xbOGo63G/cZwiYdqxOSmfj+z4wequjo38jG3kUMvrXiVRwxlhlJWCCJ1xoLfbj+1VVN64vro8IGyGQREXIdXJ5T4EbihrB1Jr+V9VhWQcdatYo5hz70BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWM4DXjhGfLABCefLHfcGyqVcy0duIDR+ZQO2IrjM2I=;
 b=Oa+d6XRAl9Q6H1gZdloQb6v2qQZzLPulWWTjlnErXWFGb6KWshN4u5h7YirsP2AP02YYfPhS8AQHxgCa7QcrVjVppx7RbzVRI6kB+JGkBPm0UcUzGVLXnX880eJEuWZpFzLdnOCq4qU3N8WyP2FUgVN1yAcNZhz5JmmC7eqiHjOj3/IbWVMQpQAV4fWydK4ZPdCcbrHp5VlYWadofmnzAwF0to90Tp2JAlt9V9EEdyRPTf0tMGvY/bLu4SHhb7zYf4aoySn+nHFHUfJGrnTnR4MBfc66mtzts33VnLRh7nUFG3h7VQydabOysPwVLFLYq/kF+QRgdKiYr7PJzBRIiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWM4DXjhGfLABCefLHfcGyqVcy0duIDR+ZQO2IrjM2I=;
 b=Hx01r+Nuvk9kGeuQEKuC9E1FBjSa9IFWIFC/0nzhMrcgpwQdsNWe63JG08PvWsPQ16p6P3uVhaxKqGQHpZzcs+g9upGAFZSGaI4S5xIX1+wQEXFEOumgSM7RoPmI3TM3h0em6VtfG7W4bosJKoCVYZEA4b4AMzvdieJ7txjS6n8=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3545.jpnprd01.prod.outlook.com (2603:1096:404:d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 20 Oct
 2020 04:42:50 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 04:42:50 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 08/20] dt-bindings: usb: renesas-xhci: Refer to the
 usb-xhci.yaml file
Thread-Topic: [PATCH 08/20] dt-bindings: usb: renesas-xhci: Refer to the
 usb-xhci.yaml file
Thread-Index: AQHWohLFbtOMYgZ0fEaKABdhF8ofKKmf8mkw
Date:   Tue, 20 Oct 2020 04:42:50 +0000
Message-ID: <TY2PR01MB36921A342B4374B5853E65ACD81F0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-9-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201014101402.18271-9-Sergey.Semin@baikalelectronics.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: baikalelectronics.ru; dkim=none (message not signed)
 header.d=none;baikalelectronics.ru; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:65e1:c1da:e357:e253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e0cf67bd-d839-4138-7e5b-08d874b2999d
x-ms-traffictypediagnostic: TY2PR01MB3545:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB3545068EE83E8730E96958E7D81F0@TY2PR01MB3545.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WK+A4gfG7J/J/BaMXioWzGIRdUVMHAIw7lUTC0zHI5w545+g2C8hRBQ1WxltcUfS/Umi5VT88Fzuw3GCdEHZCcWZGqcoExclXScuNpyRjjQsRZg4HYr8ju9PF9FmgcPt9OxvvXqv4IdRzDduciHb1NImXrVjn0b7jLD5GUTEhiC4DqmMlwm3ygRgPnqRHTEoEoL7n4FnCQ29fwfe9tzDNruYTRrPiCjyQcUx3xxKkbprLtAi7+GngKsAgXnJK4Ew/WMnEN9M/5Ix/IiSwSorjW8uIWTG78+QjZDy8yD5n0QgSlVKe7eVkiZnmH9cPvRA60Ni9Jc72TeF54d2pGBe9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(5660300002)(33656002)(4744005)(66476007)(7696005)(64756008)(66446008)(66556008)(71200400001)(83380400001)(55016002)(478600001)(76116006)(52536014)(54906003)(6506007)(110136005)(66946007)(316002)(186003)(2906002)(7416002)(8676002)(8936002)(86362001)(4326008)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 63VNagmqy5xD2WZ2ibAAdmzeqZTyq86rB5d/TCL4GajNI+zgTti5RQbRNV+b/JQaeAiG4id8tUM2ZgNPRh3LllCgugKRDFOVPwOHgvbuoROXx9A9k4I5NkiHF3sOvNBeSDQJvH7SKvoDBV4j/zfdaV5v9qe4IhikpyzxzCE4ipI/FqI6VYPNP+VDqwcbGOCdMqoTJR6Khs0zs/BPBjLDf84B8oP2r2dw2afoV06vGt1RjkBJvuIwSx5oD3T8cVDbf/W4QfwxCL3AArOQuA9r+v3O80d8ilcQ+huyF7VJED11NGAmgiN/6C23jSgZHpkktGS8mgij8BU3IWd8jX4rvpmfQQU3eO72j8xBAVGBVRqkMlzJ4hSk7dA17MiCUwa2VqJIuZZKWMyX1M/R2y5zwU9L/M+F7eIH74vEt2uuJUsURgGXmXnaZFByUXXoiOG4OJOIQGnEdi3ZzBg41h1khKzhsxBsds4OGWZs46vjKuzZOXZ13CF4jXEaJNJG+7WlZf1eor/yD32Eu7VRnbN9UjOGsaso0/5oEe2CsNaLzZoOXlxqYVz2I9WH+1gmSJ9cinFH2uvc9bCrARk6QANQb1T4id0/kLnFFQDPGgZkYriz6IoTLOzBeg7YK33EhZO5rxTq/QiwCXpKzDPnfnp37NnpueatJItb2RQu5fSaPhdSKbSR/jEm3HzDPgO4xx35CfQjJPTib2+I/e+lX/KT9g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cf67bd-d839-4138-7e5b-08d874b2999d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2020 04:42:50.0672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nfoSYQ9pjI04ARJCJ3LLt8z6Ll4Dq26ZGNr5aZQaLKsR3ah9pXIQNg/t/+no8h8sDgWWdBP79DG78gQ28KGykaLF2cHTwzKzt+YoJcwD/87P18Uv+9Gc50S+fSJx7IF2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3545
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

> From: Serge Semin, Sent: Wednesday, October 14, 2020 7:14 PM
>=20
> With minor peculiarities (like uploading some vendor-specific firmware)
> these are just Generic xHCI controllers fully compatible with its
> properties. Make sure the Renesas USB xHCI DT nodes are also validated
> against the Generic xHCI DT schema.
>=20
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

