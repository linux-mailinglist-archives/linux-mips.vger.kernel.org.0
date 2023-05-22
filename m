Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1AC70B74D
	for <lists+linux-mips@lfdr.de>; Mon, 22 May 2023 10:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjEVII2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 May 2023 04:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjEVII1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 May 2023 04:08:27 -0400
X-Greylist: delayed 720 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 22 May 2023 01:08:25 PDT
Received: from cstnet.cn (smtp83.cstnet.cn [159.226.251.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AAC51AA
        for <linux-mips@vger.kernel.org>; Mon, 22 May 2023 01:08:25 -0700 (PDT)
Received: from sunying$nj.iscas.ac.cn ( [180.111.102.60] ) by
 ajax-webmail-APP-09 (Coremail) ; Mon, 22 May 2023 15:49:10 +0800
 (GMT+08:00)
X-Originating-IP: [180.111.102.60]
Date:   Mon, 22 May 2023 15:49:10 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   sunying@nj.iscas.ac.cn
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org
Subject: Bug: arch/mips/txx9/generic/setup.c: 714-716: dead code
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.15 build 20230321(1bf45b10)
 Copyright (c) 2002-2023 www.mailtech.cn cnic.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <61c44cda.1230d.188426efee3.Coremail.sunying@nj.iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: swCowAD3__N2Hmtk4I8cAA--.57884W
X-CM-SenderInfo: 5vxq5xdqj60y4olvutnvoduhdfq/1tbiBwUTAWRrEaAwBQAAsb
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

VGhlIHNlY29uZCBlbGVtZW50IG9mIGFycmF5ICJzdHJ1Y3QgcmVzb3VyY2UgcmVzIFtdIiBpbiBh
cmNoL21pcHMvdHh4OS9nZW5lcmljL3NldHVwLmM6IDcxNC03MTYgd2lsbCBydW4Kb25seSBpZiB0
aGUgY29uZGl0aW9ucyAiI2lmIElTX0VOQUJMRUQoQ09ORklHX1RYWDlfRE1BQykiKGxpbmUgNzA3
KSBhbmQgIiNpZm5kZWYgQ09ORklHX01BQ0hfVFg0OVhYIiAobGluZSA3MTMpIGJvdGggYXJlIHRy
dWUuCgo3MDcgI2lmIElTX0VOQUJMRUQoQ09ORklHX1RYWDlfRE1BQykKNzA4ICAgICAgICAgc3Ry
dWN0IHJlc291cmNlIHJlc1tdID0gewo3MDkgICAgICAgICAgICAgICAgIHsKNzEwICAgICAgICAg
ICAgICAgICAgICAgICAgIC5zdGFydCA9IGJhc2VhZGRyLAo3MTEgICAgICAgICAgICAgICAgICAg
ICAgICAgLmVuZCA9IGJhc2VhZGRyICsgMHg4MDAgLSAxLAo3MTIgICAgICAgICAgICAgICAgICAg
ICAgICAgLmZsYWdzID0gSU9SRVNPVVJDRV9NRU0sCjcxMyAjaWZuZGVmIENPTkZJR19NQUNIX1RY
NDlYWAo3MTQgICAgICAgICAgICAgICAgIH0sIHsKNzE1ICAgICAgICAgICAgICAgICAgICAgICAg
IC5zdGFydCA9IGlycSwKNzE2ICAgICAgICAgICAgICAgICAgICAgICAgIC5mbGFncyA9IElPUkVT
T1VSQ0VfSVJRLAo3MTcgI2VuZGlmCjcxOCAgICAgICAgICAgICAgICAgfQo3MTkgICAgICAgICAg
fTsKCgpCdXQgYWNjb3JkaW5nIHRvIHRoZSBkZWZpbml0aW9uIG9mIHRoZSBjb25maWd1cmF0aW9u
IG9wdGlvbiBDT05GSUdfVFhYOV9ETUFDIChkcml2ZXJzL2RtYS9LY29uZmlnOjYxNCk6Cgpjb25m
aWcgVFhYOV9ETUFDCiAgICAgICAgdHJpc3RhdGUgIlRvc2hpYmEgVFh4OSBTb0MgRE1BIHN1cHBv
cnQiCiAgICAgICAgZGVwZW5kcyBvbiBNQUNIX1RYNDlYWAogICAgICAgIHNlbGVjdCBETUFfRU5H
SU5FCiAgICAgICAgaGVscAogICAgICAgICAgU3VwcG9ydCB0aGUgVFh4OSBTb0MgaW50ZXJuYWwg
RE1BIGNvbnRyb2xsZXIuICBUaGlzIGNhbiBiZQogICAgICAgICAgaW50ZWdyYXRlZCBpbiBjaGlw
cyBzdWNoIGFzIHRoZSBUb3NoaWJhIFRYNDkyNy8zOC8zOS4KCiJDT05GSUdfVFhYOV9ETUFDIiBk
ZXBlbmRzIG9uICJDT05GSUdfTUFDSF9UWDQ5WFgiLiAiQ09ORklHX1RYWDlfRE1BQyIgd2lsbCBv
bmx5IGJlIGVuYWJsZWQgCmlmICJDT05GSUdfTUFDSF9UWDQ5WFgiIGlzIGVuYWJsZWQuIFNvIHRo
ZSBsaW5lcyA3MTQtNzE2IGluIGFyY2gvbWlwcy90eHg5L2dlbmVyaWMvc2V0dXAuYyBpcyBhIGRl
YWQgY29kZS4KCkkgYW0gbm90IHN1cmUgd2hldGhlciBkaXJlY3RseSBkZWxldGUgdGhpcyBkZWFk
IGNvZGUgb3IgCm1vZGlmeSB0aGUgZGVwZW5kZW5jeSBvZiB0aGUgY29uZmlndXJhdGlvbiBvcHRp
b24uCk1heSBJIGFzayBob3cgdG8gbW9kaWZ5IGl0PwoKCkJlc3QgUmVnYXJkcwpZYW5qaWUgUmVu
CllpbmcgU3Vu
