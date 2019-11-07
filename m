Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 478ABF2E92
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 13:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388867AbfKGMy1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Nov 2019 07:54:27 -0500
Received: from ozlabs.org ([203.11.71.1]:41487 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388641AbfKGMy1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 Nov 2019 07:54:27 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4783J72b3Dz9sR7;
        Thu,  7 Nov 2019 23:54:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1573131261;
        bh=kVcSRWwnPjpL30z4/b6SOIlevawzxnLE8imaExIycJY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=J2h2GXut1G+LNf/hqVUky6Kv1okUdOEISaHZnkeLHqrnhlwT+bA9T64CihqGYeSi8
         FHqUnJ0oF72N0INlgQid9nAvR37A00no52vbAalB76M0lCSA0BbkwPYukjEI9zgIqJ
         tb7uzy0rwx9XsO7BF+60IISTFRNOQFeSPiO/N7vBTSKV/xk5TRX4wUogeJt5tridyc
         ajDOlF9wzJOEvH9zg+9K3CNkwMLwmaLgT2Ak7loNO3/YuuIOYxxMGIE180Ya7SHWI7
         TmxPjV3AUAn3SdBlwRrQJlfPszjY2prRFisV7GuIvzRBmAWb6K7cUfMqWt55qNZ9my
         MCHuJ+1AEdMgw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table helpers
In-Reply-To: <0e0c2ce9-636d-1153-2451-baf7317ed45f@arm.com>
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com> <3229d68d-0b9d-0719-3370-c6e1df0ea032@arm.com> <42160baa-0e9d-73d0-bf72-58bdbacf10ff@c-s.fr> <0e0c2ce9-636d-1153-2451-baf7317ed45f@arm.com>
Date:   Thu, 07 Nov 2019 23:54:08 +1100
Message-ID: <87tv7f4zkf.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

QW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+IHdyaXRlczoNCj4g
T24gMTEvMDYvMjAxOSAxMjoxMSBQTSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IExlIDA2
LzExLzIwMTkgw6AgMDQ6MjIsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6DQo+Pj4gT24g
MTAvMjgvMjAxOSAxMDo1OSBBTSwgQW5zaHVtYW4gS2hhbmR1YWwgd3JvdGU6DQo+Pj4+ICvCoMKg
wqAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4gK8KgwqDCoCB8wqDCoMKgwqDCoMKgwqDC
oCBhcmNoIHxzdGF0dXN8DQo+Pj4+ICvCoMKgwqAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+
Pj4gK8KgwqDCoCB8wqDCoMKgwqDCoMKgIGFscGhhOiB8IFRPRE8gfA0KPj4+PiArwqDCoMKgIHzC
oMKgwqDCoMKgwqDCoMKgIGFyYzogfCBUT0RPIHwNCj4+Pj4gK8KgwqDCoCB8wqDCoMKgwqDCoMKg
wqDCoCBhcm06IHwgVE9ETyB8DQo+Pj4+ICvCoMKgwqAgfMKgwqDCoMKgwqDCoCBhcm02NDogfMKg
IG9rwqAgfA0KPj4+PiArwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgIGM2eDogfCBUT0RPIHwNCj4+
Pj4gK8KgwqDCoCB8wqDCoMKgwqDCoMKgwqAgY3NreTogfCBUT0RPIHwNCj4+Pj4gK8KgwqDCoCB8
wqDCoMKgwqDCoMKgIGg4MzAwOiB8IFRPRE8gfA0KPj4+PiArwqDCoMKgIHzCoMKgwqDCoCBoZXhh
Z29uOiB8IFRPRE8gfA0KPj4+PiArwqDCoMKgIHzCoMKgwqDCoMKgwqDCoCBpYTY0OiB8IFRPRE8g
fA0KPj4+PiArwqDCoMKgIHzCoMKgwqDCoMKgwqDCoCBtNjhrOiB8IFRPRE8gfA0KPj4+PiArwqDC
oMKgIHzCoCBtaWNyb2JsYXplOiB8IFRPRE8gfA0KPj4+PiArwqDCoMKgIHzCoMKgwqDCoMKgwqDC
oCBtaXBzOiB8IFRPRE8gfA0KPj4+PiArwqDCoMKgIHzCoMKgwqDCoMKgwqAgbmRzMzI6IHwgVE9E
TyB8DQo+Pj4+ICvCoMKgwqAgfMKgwqDCoMKgwqDCoCBuaW9zMjogfCBUT0RPIHwNCj4+Pj4gK8Kg
wqDCoCB8wqDCoMKgIG9wZW5yaXNjOiB8IFRPRE8gfA0KPj4+PiArwqDCoMKgIHzCoMKgwqDCoMKg
IHBhcmlzYzogfCBUT0RPIHwNCj4+Pj4gK8KgwqDCoCB8wqDCoMKgwqAgcG93ZXJwYzogfCBUT0RP
IHwNCj4+Pj4gK8KgwqDCoCB8wqDCoMKgwqDCoMKgIHBwYzMyOiB8wqAgb2vCoCB8DQo+PiANCj4+
IE5vdGUgdGhhdCBwcGMzMiBpcyBhIHBhcnQgb2YgcG93ZXJwYywgbm90IGEgc3RhbmRhbG9uZSBh
cmNoLg0KPg0KPiBSaWdodCwgSSB1bmRlcnN0YW5kLiBCdXQgd2UgYXJlIHlldCB0byBoZWFyIGFi
b3V0IGhvdyB0aGlzIHRlc3QNCj4gY2FtZSBhYm91dCBvbiBwb3dlcnBjIHNlcnZlciBwbGF0Zm9y
bXMuIFdpbGwgdXBkYXRlICdwb3dlcnBjJw0KPiBhcmNoIGxpc3RpbmcgYWJvdmUgb25jZSB3ZSBn
ZXQgc29tZSBjb25maXJtYXRpb24uIE1heSBiZSBvbmNlDQo+IHRoaXMgd29ya3Mgb24gYWxsIHJl
bGV2YW50IHBvd2VycGMgcGxhdGZvcm1zLCB3ZSBjYW4ganVzdCBtZXJnZQ0KPiAncG93ZXJwYycg
YW5kICdwcGMzMicgZW50cmllcyBoZXJlIGFzIGp1c3QgJ3Bvd2VycGMnLg0KDQpPbiBwc2VyaWVz
Og0KDQogIHdhdGNoZG9nOiBCVUc6IHNvZnQgbG9ja3VwIC0gQ1BVIzAgc3R1Y2sgZm9yIDIzcyEg
W3N3YXBwZXIvMDoxXQ0KICBNb2R1bGVzIGxpbmtlZCBpbjoNCiAgQ1BVOiAwIFBJRDogMSBDb21t
OiBzd2FwcGVyLzAgTm90IHRhaW50ZWQgNS40LjAtcmM2LWdjYy04LjIuMC1uZXh0LTIwMTkxMTA3
LTAwMDAxLWcyNTAzMzlkNjc0N2ItZGlydHkgIzE1Mg0KICBOSVA6ICBjMDAwMDAwMDAxMDQzNWEw
IExSOiBjMDAwMDAwMDAxMDQzNGI0IENUUjogMDAwMDAwMDAwMDAwMDAwMA0KICBSRUdTOiBjMDAw
MDAwMDNhNDAzOTgwIFRSQVA6IDA5MDEgICBOb3QgdGFpbnRlZCAgKDUuNC4wLXJjNi1nY2MtOC4y
LjAtbmV4dC0yMDE5MTEwNy0wMDAwMS1nMjUwMzM5ZDY3NDdiLWRpcnR5KQ0KICBNU1I6ICA4MDAw
MDAwMDAyMDA5MDMzIDxTRixWRUMsRUUsTUUsSVIsRFIsUkksTEU+ICBDUjogNDQwMDAyMjIgIFhF
UjogMDAwMDAwMDANCiAgQ0ZBUjogYzAwMDAwMDAwMTA0MzVhOCBJUlFNQVNLOiAwIA0KICBHUFIw
MDogYzAwMDAwMDAwMTA0MzRiNCBjMDAwMDAwMDNhNDAzYzEwIGMwMDAwMDAwMDEyOTUwMDAgMDUy
MTAwMDEwMDAwMDBjMCANCiAgR1BSMDQ6IDgwMDAwMDAwMDAwMDAxMDUgMDAwMDAwMDAwMDQwMGRj
MCAwMDAwMDAwMDNlYjAwMDAwIDAwMDAwMDAwMDAwMDAwMDEgDQogIEdQUjA4OiAwMDAwMDAwMDAw
MDAwMDAwIGZmZmZmZmZmZmZmZmZmZmYgMDAwMDAwMDAwMDAwMDAwMSAwMDAwMDAwMDAwMDAwMTAw
IA0KICBHUFIxMjogMDAwMDAwMDAwMDAwMDAwMCBjMDAwMDAwMDAxOGYwMDAwIA0KICBOSVAgW2Mw
MDAwMDAwMDEwNDM1YTBdIGRlYnVnX3ZtX3BndGFibGUrMHg0M2MvMHg4MmMNCiAgTFIgW2MwMDAw
MDAwMDEwNDM0YjRdIGRlYnVnX3ZtX3BndGFibGUrMHgzNTAvMHg4MmMNCiAgQ2FsbCBUcmFjZToN
CiAgW2MwMDAwMDAwM2E0MDNjMTBdIFtjMDAwMDAwMDAxMDQzNDZjXSBkZWJ1Z192bV9wZ3RhYmxl
KzB4MzA4LzB4ODJjICh1bnJlbGlhYmxlKQ0KICBbYzAwMDAwMDAzYTQwM2NlMF0gW2MwMDAwMDAw
MDEwMDQzMTBdIGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4MWQwLzB4MzljDQogIFtjMDAwMDAwMDNh
NDAzZGIwXSBbYzAwMDAwMDAwMDAxMGRhMF0ga2VybmVsX2luaXQrMHgyNC8weDE3NA0KICBbYzAw
MDAwMDAzYTQwM2UyMF0gW2MwMDAwMDAwMDAwMGJkYzRdIHJldF9mcm9tX2tlcm5lbF90aHJlYWQr
MHg1Yy8weDc4DQogIEluc3RydWN0aW9uIGR1bXA6DQogIDdkMDc1MDc4IDdjZTc0Yjc4IDdjZTBm
OWFkIDQwYzJmZmYwIDM4ODAwMDAwIDdmODNlMzc4IDRiMDJlZWUxIDYwMDAwMDAwIA0KICA0ODAw
MDA4MCAzOTIwZmZmZiAzOTQwMDAwMSAzOTAwMDAwMCA8N2VhMGY4YTg+IDdlYTc1MDM5IDQwYzJm
ZmY4IDdlYTc0ODc4IA0KDQpMb29raW5nIGF0IHRoZSBhc20gSSB0aGluayBpdCdzIHN0dWNrIGlu
IGhhc2hfX3B0ZV91cGRhdGUoKSB3YWl0aW5nIGZvcg0KSF9QQUdFX0JVU1kgdG8gY2xlYXIsIGJ1
dCBub3Qgc3VyZSB3aHkuDQoNClRoYXQncyBqdXN0IHVzaW5nIHFlbXUgVENHLCBpbnN0cnVjdGlv
bnMgaGVyZSBpZiBhbnlvbmUgd2FudHMgdG8gdGVzdCBpdA0KdGhlbXNlbHZlcyA6KQ0KDQogIGh0
dHBzOi8vZ2l0aHViLmNvbS9saW51eHBwYy93aWtpL3dpa2kvQm9vdGluZy13aXRoLVFlbXUNCg0K
DQpJZiBJIGJvb3Qgd2l0aCAtY3B1IHBvd2VyOSAodXNpbmcgUmFkaXggTU1VKSwgSSBnZXQgYSBw
bGFpbiBvbGQgQlVHOg0KDQogIGRlYnVnX3ZtX3BndGFibGU6IGRlYnVnX3ZtX3BndGFibGU6IFZh
bGlkYXRpbmcgYXJjaGl0ZWN0dXJlIHBhZ2UgdGFibGUgaGVscGVycw0KICAtLS0tLS0tLS0tLS1b
IGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCiAga2VybmVsIEJVRyBhdCBhcmNoL3Bvd2VycGMvbW0v
cGd0YWJsZS5jOjI3NCENCiAgT29wczogRXhjZXB0aW9uIGluIGtlcm5lbCBtb2RlLCBzaWc6IDUg
WyMxXQ0KICBMRSBQQUdFX1NJWkU9NjRLIE1NVT1SYWRpeCBTTVAgTlJfQ1BVUz0zMiBOVU1BIHBT
ZXJpZXMNCiAgTW9kdWxlcyBsaW5rZWQgaW46DQogIENQVTogMCBQSUQ6IDEgQ29tbTogc3dhcHBl
ci8wIE5vdCB0YWludGVkIDUuNC4wLXJjNi1nY2MtOC4yLjAtbmV4dC0yMDE5MTEwNy0wMDAwMS1n
MjUwMzM5ZDY3NDdiLWRpcnR5ICMxNTINCiAgTklQOiAgYzAwMDAwMDAwMDA3MjRlOCBMUjogYzAw
MDAwMDAwMTA0MzU4YyBDVFI6IDAwMDAwMDAwMDAwMDAwMDANCiAgUkVHUzogYzAwMDAwMDAzYTQ4
Mzk4MCBUUkFQOiAwNzAwICAgTm90IHRhaW50ZWQgICg1LjQuMC1yYzYtZ2NjLTguMi4wLW5leHQt
MjAxOTExMDctMDAwMDEtZzI1MDMzOWQ2NzQ3Yi1kaXJ0eSkNCiAgTVNSOiAgODAwMDAwMDAwMjAy
OTAzMyA8U0YsVkVDLEVFLE1FLElSLERSLFJJLExFPiAgQ1I6IDI0MDAwMjI0ICBYRVI6IDIwMDAw
MDAwDQogIENGQVI6IGMwMDAwMDAwMDEwNDM1ODggSVJRTUFTSzogMCANCiAgR1BSMDA6IGMwMDAw
MDAwMDEwNDM1OGMgYzAwMDAwMDAzYTQ4M2MxMCBjMDAwMDAwMDAxMjk1MDAwIDAwMDAwMDAwMDAw
MDAwMDkgDQogIEdQUjA0OiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDUgMDAwMDAw
MDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDA5IA0KICBHUFIwODogMDAwMDAwMDAwMDAwMDAwMSAw
MDAwMDAwMDAwMDAwMDBlIDAwMDAwMDAwMDAwMDAwMDEgYzAwMDAwMDAzYTVmMDAwMCANCiAgR1BS
MTI6IDAwMDAwMDAwMDAwMDAwMDAgYzAwMDAwMDAwMThmMDAwMCBjMDAwMDAwMDAwMDEwZDg0IDAw
MDAwMDAwMDAwMDAwMDAgDQogIEdQUjE2OiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAw
MDAgYzAwMDAwMDAzYTVmMDAwMCA4MDAwMDAwMDAwMDAwMTA1IA0KICBHUFIyMDogYzAwMDAwMDAw
MTAwM2FiOCAwMDAwMDAwMDAwMDAwMDE1IDA1MDA2MTNhMDAwMDAwODAgMDkwMDYwM2EwMDAwMDA4
MCANCiAgR1BSMjQ6IDA5MjAyZTNhMDAwMDAwODAgYzAwMDAwMDAwMTMzYmQ5MCBjMDAwMDAwMDAx
MzNiZDk4IGMwMDAwMDAwMDEzM2JkYTAgDQogIEdQUjI4OiBjMDAwMDAwMDNhNWUwMDAwIGMwMDAw
MDAwM2E2MDBhZjggYzAwMDAwMDAzYTJlMmQ0OCBjMDAwMDAwMDNhNjEwMGEwIA0KICBOSVAgW2Mw
MDAwMDAwMDAwNzI0ZThdIGFzc2VydF9wdGVfbG9ja2VkKzB4ODgvMHgxOTANCiAgTFIgW2MwMDAw
MDAwMDEwNDM1OGNdIGRlYnVnX3ZtX3BndGFibGUrMHg0MjgvMHg4MmMNCiAgQ2FsbCBUcmFjZToN
CiAgW2MwMDAwMDAwM2E0ODNjMTBdIFtjMDAwMDAwMDAxMDQzNDZjXSBkZWJ1Z192bV9wZ3RhYmxl
KzB4MzA4LzB4ODJjICh1bnJlbGlhYmxlKQ0KICBbYzAwMDAwMDAzYTQ4M2NlMF0gW2MwMDAwMDAw
MDEwMDQzMTBdIGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4MWQwLzB4MzljDQogIFtjMDAwMDAwMDNh
NDgzZGIwXSBbYzAwMDAwMDAwMDAxMGRhMF0ga2VybmVsX2luaXQrMHgyNC8weDE3NA0KICBbYzAw
MDAwMDAzYTQ4M2UyMF0gW2MwMDAwMDAwMDAwMGJkYzRdIHJldF9mcm9tX2tlcm5lbF90aHJlYWQr
MHg1Yy8weDc4DQogIEluc3RydWN0aW9uIGR1bXA6DQogIDdkMjUxYTE0IDM5MDcwMDEwIDdkNDYz
MDMwIDdkMDg0YTE0IDM4YzZmZmZmIDdjODg0NDM2IDdjYzYwN2I0IDdkMDgzMDM4IA0KICA3OTA4
MWYyNCA3Y2NiNDAyYSA3Y2M4MDA3NCA3OTA4ZDE4MiA8MGIwODAwMDA+IDc4Y2IwMDIyIDU0Yzhj
MDNlIDdkNDczODMwIA0KICAtLS1bIGVuZCB0cmFjZSBhNjk0ZjFiYzU2NTI5YzBlIF0tLS0NCg0K
DQpjaGVlcnMNCg==
