Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97368183E9D
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2020 02:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgCMBPU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Mar 2020 21:15:20 -0400
Received: from server100i.appriver.com ([8.31.233.122]:57416 "EHLO
        server100.appriver.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726620AbgCMBPU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Mar 2020 21:15:20 -0400
X-Greylist: delayed 903 seconds by postgrey-1.27 at vger.kernel.org; Thu, 12 Mar 2020 21:15:19 EDT
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 03/12/2020 9:00:17 PM
X-Note: SecureTide Build: 2/6/2020 4:08:38 PM UTC (2.8.16.0)
X-Note: Filtered by 10.60.0.55
X-Note-AR-Scan: None - PIPE
Received: by server100.appriver.com (CommuniGate Pro PIPE 6.2.12)
  with PIPE id 14587038; Thu, 12 Mar 2020 21:00:17 -0400
Received: from [208.79.213.174] (HELO palladium.modernmerchant.com)
  by server100.appriver.com (CommuniGate Pro SMTP 6.2.12)
  with ESMTP id 14587036 for linux-mips@vger.kernel.org; Thu, 12 Mar 2020 21:00:16 -0400
Message-ID: <OF26152112.986B2B0A-ON8525852A.000582FC-1584061212143@modernmerchant.com>
Subject: Recommended soft CPU for FPGA for Linux-mips?
To:     linux-mips@vger.kernel.org
From:   Timothy J Massey <tmassey@modernmerchant.com>
Date:   Thu, 12 Mar 2020 21:00:12 -0400
X-Mailer: IBM Traveler 9.0.1.7 Build 201508211840_20
X-KeepSent: 26152112:986B2B0A-8525852A:000582FC;
 type=4; name=$KeepSent
X-MIMETrack: Serialize by Router on palladium/OBSCorp(Release 9.0.1FP4|June  07, 2015) at
 03/12/2020 09:00:17 PM
MIME-Version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: base64
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 03/12/2020 9:00:16 PM
X-Note: SecureTide Build: 2/6/2020 4:08:38 PM UTC (2.8.16.0)
X-Note: Filtered by 10.60.0.55
X-Policy: obscorp.com
X-Primary: obscorp.com@obscorp.com
X-Note-Sender: <tmassey@modernmerchant.com>
X-Virus-Scan: V-
X-Note-SnifferID: 0
X-GBUdb-Analysis: 0, 208.79.213.174, Ugly c=0 p=0 Source New
X-Signature-Violations: 0-0-0-5060-c
X-Note-419: 11.8879 ms. Fail:0 Chk:1357 of 1357 total
X-Note: VSCH-CT/SI: 0-1357/SG:1 3/12/2020 8:59:35 PM
X-Note: Spam Tests Failed: 
X-Country-Path: United States of America->
X-Note-Sending-IP: 208.79.213.174
X-Note-Reverse-DNS: oxygen.obscorp.com
X-Note-Return-Path: tmassey@modernmerchant.com
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G708 G709 G710 G711 G729 G730 G731 G886 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

DQpIZWxsbw0KDQpJ4oCZbSB0cnlpbmcgdG8gZmluZCBhIHJlY29tbWVuZGF0aW9uIGZvciBhIHNv
ZnQgQ1BVIHRvIHJ1biBMaW51eC1taXBzLg0KSWRlYWxseSwgSSBoYXZlIGEgVGVyYXNpYyBEZTAt
bmFubyBib2FyZCBhbmQgSSB3b3VsZCBsaWtlIHRvIHVzZSBpdCB0bw0Kc3ludGhlc2l6ZSBhIE1J
UFMgQ1BVIEkgY291bGQgdXNlIHRvIGJvb3QgYSBtYWlubGluZSBNSVBTIGtlcm5lbCB3aXRoLiAg
SQ0Kb3JpZ2luYWxseSBwdXJjaGFzZWQgdGhpcyB0byB1c2Ugd2l0aCBPcGVuUklTQywgYnV0IHRo
YXQgc2VlbXMgdG8gaGF2ZQ0Kc3RhbGxlZDogSeKAmWQgcmF0aGVyIHdvcmsgd2l0aCBzb21ldGhp
bmcgbW9yZSBtYWluc3RyZWFtIGlmIEkgY2FuLiAgTUlQUw0Kc2VlbWVkIGxpa2UgYSBncmVhdCBp
bnRlcnNlY3Rpb24gb2Ygc2ltcGxpY2l0eSBhbmQgcmVhbC13b3JsZCBwcmFjdGljYWxpdHkuDQpJ
ZiBhbm90aGVyIChhZmZvcmRhYmxlKSBib2FyZCB3b3VsZCBiZSBhIGJldHRlciBmaXQsIEnigJlt
IGNlcnRhaW5seSBvcGVuLg0KQnV0IEkgd291bGQgbGlrZSB0byB1c2UgYSBmdWxseSBzeW50aGVz
aXplZCBvcGVuIENQVSBpZiBhdCBhbGwgcG9zc2libGUuDQoNCknigJl2ZSB0cmllZCBHb29nbGlu
ZyBmb3IgcmVjb21tZW5kYXRpb25zLCBidXQgdGhpcyBpcyBtYWRlIGRpZmZpY3VsdCBieSBhDQpm
ZXcgdGhpbmdzOiAgcHJvcHJpZXRhcnkgc29mdCBjb3JlcyBwcm92aWRlZCBieSBGUEdBIG1ha2Vy
cyBhbmQgdGllZCB0bw0KdGhlaXIgRlBHQeKAmXM7IOKAnE1JUFMtbGlrZeKAnSBjb3JlcyB0aGF0
IGFyZSB2YWd1ZSBhYm91dCB3aGF0IOKAnE1JUFMtbGlrZeKAnQ0KcmVhbGx5IG1lYW5zOyBhbmQg
dGhlIGNvbmZ1c2lvbiBhcm91bmQgdGhlIHByZXNlbmNlIG9yIGFic2VuY2Ugb2YgdW5hbGlnbmVk
DQpsb2FkL3N0b3JlIGFuZCB3aGF0IGltcGFjdCB0aGF0IGhhcy4gIChNeSB1bmRlcnN0YW5kaW5n
IGlzIHRoZSBwYXRlbnRzIGhhdmUNCmV4cGlyZWQsIHNvIGl0IHNob3VsZG7igJl0IGJlIG5lY2Vz
c2FyeSB0byBhdm9pZCB0aGVtIGFueW1vcmU/KS4NCg0KTUlQUyBPcGVuIGhhc27igJl0IG1hZGUg
dGhpcyBhbnkgZWFzaWVyLiAgVGhleSB0cnVtcGV0IHRoZWlyIG9wZW5uZXNzLCBidXQNCndyYXAg
ZXZlcnl0aGluZyB1cCBpbnRvIGEgY29uZnVzaW5nIG1lc3Mgb2Yg4oCccHJvZHVjdHPigJ0gdGhh
dCBhcmUgbW9yZSBzYWxlcw0KaW5mb3JtYXRpb24gdGhhbiBhbnl0aGluZyBlbHNlLg0KDQpBbmQg
d2hpbGUgdGhlIExpbnV4LU1JUFMgd2Vic2l0ZSBsaXN0cyBjb21wYXRpYmxlIGNvbXB1dGVycywg
U29DLCBldGMuLCBJDQpkaWRu4oCZdCBzZWUgYW55IGxpc3RpbmdzIGZvciBhbnkgRlBHQSAvIHNv
ZnQgQ1BVIGVudmlyb25tZW50cy4NCg0KRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIGZvciBh
IHJlY29tbWVuZGVkIHNvZnQgQ1BVIHRvIHVzZSB3aXRoDQpMaW51eC1taXBzPyAgQW55IGluZm9y
bWF0aW9uIHdvdWxkIGJlIGFwcHJlY2lhdGVkLg0KDQpUaGFuayB5b3UhDQoNClRpbW90aHkgTWFz
c2V5


